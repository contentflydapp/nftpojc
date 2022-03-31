#!/bin/bash

# ------------ IMPORTANT NOTES ----------
# When setting controller to a canister, it will override all existing controller.
# So make sure you have added all the needed controllers in the cmd.

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
ICDEV_WALLET="$WALLET_PRINCIPAL_IC_DEV"
ICPROD_JOB="$JOB_CANISTER_ID_IC_PROD"
ICDEV_JOB="$JOB_CANISTER_ID_IC_DEV"
LOCAL_JOB="$JOB_CANISTER_ID"

deploylocal() {
  printf "Updatting controller for NFT Canister\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"

  dfx canister update-settings --controller $DFX_IDENTITY_PRINCIPAL --controller $(dfx canister id nft) --controller $LOCAL_JOB -- nft

  printf "\n\n"
}

deployicdev() {
  printf "Updatting controller for NFT Canister\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"
  
  dfx canister --network ic update-settings --controller $DFX_IDENTITY_PRINCIPAL --controller $(dfx canister --network ic id nft) --controller $ICDEV_WALLET --controller $ICPROD_JOB --controller $ICDEV_JOB -- nft

  printf "\n\n"
}

deploylocal

exit 0