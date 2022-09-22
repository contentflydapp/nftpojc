#!/bin/sh -l
printf "Identity: $(dfx identity whoami)\n"

mintlocal() {
  printf "Minting NFT to: $WALLET_ACCOUNT_DEV_PRINCIPAL\n"

  dfx canister call nft mintDip721 "(principal \"$WALLET_ACCOUNT_DEV_PRINCIPAL\", vec{
    record { 
      purpose=variant { Preview };
      data=blob \"\";
      key_val_data=vec {
        record {
          key=\"name\";
          val=variant { TextContent = \"Content Fly PoJC NFT\" };
        }
      }
    }
  })"
}

minticdev() {
  printf "Minting NFT to: $WALLET_ACCOUNT_PRINCIPAL\n"

  dfx canister --network ic call nft mintDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\", vec{
    record { 
      purpose=variant { Preview };
      data=blob \"\";
      key_val_data=vec {
        record {
          key=\"name\";
          val=variant { TextContent = \"Content Fly PoJC NFT\" };
        }
      }
    }
  })"
}

mintlocal

exit 0