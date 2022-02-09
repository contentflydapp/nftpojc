#!/bin/bash

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
TOKEN_ID="CFJ"
TOKEN_NAME="Content Fly PoJC NFT"
CANISTER_CAP_LOCAL_ID="rrkah-fqaaa-aaaaa-aaaaq-cai"

deploy() {
  printf "Deploying the CF PoJC NFT Canister\n"
  printf "TOKEN_ID=$TOKEN_ID\n"
  printf "TOKEN_NAME=$TOKEN_NAME\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"
  printf "CANISTER_CAP_ID=$CANISTER_CAP_ID\n"

  # dfx canister create nft
  dfx deploy nft --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_LOCAL_ID\")"
  dfx canister update-settings --controller $DFX_IDENTITY_PRINCIPAL --controller $(dfx canister id nft) -- nft

  printf "\n\n"
}

deploy

exit 0