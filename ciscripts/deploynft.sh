#!/bin/bash

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
TOKEN_ID="CFJ"
TOKEN_NAME="Content Fly - PoJC NFT"

deploy() {
  printf "Deploying the CF PoJC NFT Canister\n"

  dfx deploy --no-wallet nft --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_ID\")"

  dfx canister --no-wallet \
  call aaaaa-aa \
  update_settings "(
    record { 
      canister_id=principal \"$(dfx canister id nft)\";
      settings=record {
        controllers=opt vec{
          principal\"$DFX_IDENTITY_PRINCIPAL\";
          principal\"$(dfx canister id nft)\";
        }
      }
    }
  )"
  
  printf "\n\n"
}

deploy

exit 0