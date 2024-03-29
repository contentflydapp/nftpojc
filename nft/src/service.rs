use crate::types::*;
use crate::utils::*;

use ic_kit::candid::export_service;
use ic_kit::ic;
use ic_kit::ic::trap;
use ic_kit::macros::*;

use cap_sdk::{handshake, CapEnv, DetailValue, IndefiniteEventBuilder};

/// Health check
#[query]
fn name() -> String {
    String::from("Content Fly PoJC NFT")
}

#[query(name = "balanceOfDip721")]
fn balance_of_dip721(user: Principal) -> u64 {
    ledger().balance_of(&user.into())
}

#[query(name = "ownerOfDip721")]
fn owner_of_dip721(token_id: u64) -> Result<Principal, ApiError> {
    ledger().owner_of(&token_id.to_string())
}

#[query(name = "supportedInterfacesDip721")]
fn supported_interfaces_dip721() -> Vec<InterfaceId> {
    vec![InterfaceId::Mint, InterfaceId::TransactionHistory]
}

#[query(name = "logoDip721")]
fn logo_dip721() -> LogoResult {
    token_level_metadata().logo.clone()
}

#[query(name = "nameDip721")]
fn name_dip721() -> &'static str {
    &token_level_metadata().name
}

#[query(name = "symbolDip721")]
fn symbol_dip721() -> &'static str {
    &token_level_metadata().symbol
}

#[query(name = "totalSupplyDip721")]
fn total_supply_dip721() -> u64 {
    ledger().total_supply()
}

#[query(name = "getMetadataDip721")]
fn get_metadata_dip721(token_id: u64) -> MetadataResult {
    ledger().get_metadata(token_id)
}

#[query(name = "getMaxLimitDip721")]
fn get_max_limit_dip721() -> u16 {
    unimplemented!();
}

#[allow(unreachable_code, unused_variables)]
#[query(name = "getMetadataForUserDip721")]
fn get_metadata_for_user_dip721(user: Principal) -> Vec<ExtendedMetadataResult> {
    ledger().get_metadata_for_user(&user)
}

#[allow(unreachable_code, unused_variables)]
#[query(name = "getTokenIdsForUserDip721")]
fn get_token_ids_for_user_dip721(user: Principal) -> Vec<u64> {
    ledger().get_token_ids_for_user(&user)
}

#[update(name = "setLogoDip721")]
async fn set_logo_dip721(logo: LogoResult) -> LogoUpdateReceipt {
    let caller = ic::caller();
    if !is_controller(&caller).await {
        return Err(ApiError::Unauthorized);
    }

    token_level_metadata().logo = logo;

    return Ok(String::from("success"));
}

// Only allow minting by the controller of the smart contract
#[update(name = "mintDip721")]
async fn mint_dip721(to: Principal, metadata_desc: MetadataDesc) -> MintReceipt {
    let caller = ic::caller();
    if !is_controller(&caller).await {
        return Err(ApiError::Unauthorized);
    }

    let response = ledger().mint_nft(&to, &metadata_desc).unwrap();
    let event = IndefiniteEventBuilder::new()
        .caller(caller)
        .operation("mint")
        .details(vec![
            ("to".into(), DetailValue::Principal(to)),
            ("token_id".into(), DetailValue::U64(response.token_id)),
        ])
        .build()
        .unwrap();

    let tx_id = insert_into_cap(event).await.unwrap();

    Ok(MintReceiptPart {
        token_id: response.token_id,
        id: tx_id.into(),
    })
}

#[query]
fn bearer(token_identifier: TokenIdentifier) -> AccountIdentifierReturn {
    ledger().bearer(&token_identifier)
}

#[allow(unreachable_code, unused_variables)]
#[query(name = "getAllMetadataForUser")]
fn get_all_metadata_for_user(user: User) -> Vec<TokenMetadata> {
    trap("Disabled as current EXT metadata doesn't allow multiple assets per token");
    ledger().get_all_metadata_for_user(&user)
}

#[query]
fn supply(token_identifier: TokenIdentifier) -> BalanceReturn {
    ledger().supply(&token_identifier)
}

#[allow(unreachable_code, unused_variables)]
#[query]
fn metadata(token_identifier: TokenIdentifier) -> MetadataReturn {
    trap("Disabled as current EXT metadata doesn't allow multiple assets per token");
    ledger().metadata(&token_identifier)
}

#[query(name = "__get_candid_interface")]
fn export_candid() -> String {
    export_service!();
    __export_service()
}

fn store_data_in_stable_store() {
    // Store the canister state alongside CapEnv data to the stable storage
    // so that we can recover this data after an upgrade.
    let data = StableStorageBorrowed {
        ledger: ledger(),
        token: token_level_metadata(),
    };
    let stable_data = (data, cap_sdk::CapEnv::to_archive());

    ic::stable_store(stable_data).expect("failed");
}

fn restore_data_from_stable_store() {
    let (data, env): (StableStorage, CapEnv) = ic::stable_restore().expect("failed");
    // Always remember to call "load_from_archive" to load the CapEnv that
    // we stored during the pre_upgrade.
    CapEnv::load_from_archive(env);

    ic::store(data.ledger);
    ic::store(data.token);
}

#[init]
fn init(owner: Principal, symbol: String, name: String, history: Principal, logo: LogoResult) {
    *token_level_metadata() =
        TokenLevelMetadata::new(Some(owner), symbol, name, Some(history), logo);
    handshake(1_000_000_000_000, Some(history));
}

#[pre_upgrade]
fn pre_upgrade() {
    ic_cdk::api::print(format!("Executing preupgrade"));
    store_data_in_stable_store();
}

#[post_upgrade]
fn post_upgrade() {
    ic_cdk::api::print(format!("Executing postupgrade"));
    restore_data_from_stable_store();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn save_candid() {
        use std::env;
        use std::fs::write;
        use std::path::PathBuf;

        let dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR").unwrap());
        let dir = dir.parent().unwrap();
        write(dir.join("nft.did"), export_candid()).expect("Write failed.");
    }
}
