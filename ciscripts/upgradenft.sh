#!/bin/sh -l

# Upgrade Canisters
DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
TOKEN_ID="CFJ"
TOKEN_NAME="Content Fly PoJC NFT"

printf "Deploying the CF PoJC NFT Canister\n"
printf "TOKEN_ID=$TOKEN_ID\n"
printf "TOKEN_NAME=$TOKEN_NAME\n"
printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"
printf "CANISTER_CAP_ID=$CANISTER_CAP_ID\n"
printf "\n\n"

dfx build --network ic nft
dfx canister --no-wallet --network ic install nft --mode upgrade --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_ID\")"