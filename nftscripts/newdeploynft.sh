#!/bin/bash

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
TOKEN_ID="CFJ"
TOKEN_NAME="Content Fly PoJC NFT"
CANISTER_CAP_ID="$CANISTER_CAP_ID"
CANISTER_CAP_LOCAL_ID="$CANISTER_CAP_LOCAL_ID"
LOGO_BASE64=$(cat nft/logo/logo.txt)

deploylocal() {
  printf "Deploying the CF PoJC NFT Canister\n"
  printf "TOKEN_ID=$TOKEN_ID\n"
  printf "TOKEN_NAME=$TOKEN_NAME\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"
  printf "CANISTER_CAP_LOCAL_ID=$CANISTER_CAP_LOCAL_ID\n"

  dfx canister create nft
  dfx deploy nft --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_LOCAL_ID\", 
  record {
    logo_type=\"image/jpg\";
    data=\"$LOGO_BASE64\";
  })" 
  
  dfx canister update-settings --controller $DFX_IDENTITY_PRINCIPAL --controller $(dfx canister id nft) --controller  -- nft

  printf "\n\n"
}

deployicdev() {
  printf "Deploying the CF PoJC NFT Canister\n"
  printf "TOKEN_ID=$TOKEN_ID\n"
  printf "TOKEN_NAME=$TOKEN_NAME\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"
  printf "CANISTER_CAP_ID=$CANISTER_CAP_ID\n"

  dfx canister --network ic create nft

  dfx deploy --network ic nft --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_ID\", 
  record {
    logo_type=\"image/jpg\";
    data=\"$LOGO_BASE64\";
  })" 
  
  dfx canister --network ic update-settings --controller $DFX_IDENTITY_PRINCIPAL --controller $(dfx canister --network ic id nft) -- nft

  printf "\n\n"
}

deploylocal

exit 0