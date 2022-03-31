#!/bin/bash

# ------------ IMPORTANT NOTES ----------
# When setting controller to a canister, it will override all existing controller.
# So make sure you have added all the needed controllers in the cmd.

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
ICDEV_WALLET="vwjwx-7qaaa-aaaah-qabla-cai"
ICPROD_JOB="akpg4-7qaaa-aaaah-aa4rq-cai"
ICDEV_JOB="nlxgr-sqaaa-aaaah-qccjq-cai"
LOCAL_JOB="r7inp-6aaaa-aaaaa-aaabq-cai"

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