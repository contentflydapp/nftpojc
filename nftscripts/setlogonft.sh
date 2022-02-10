#!/bin/bash

DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
LOGO_BASE64=$(cat nft/logo/logo.txt)

setlocal() {
  printf "Setting Logo\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"

  dfx canister --no-wallet call nft setLogoDip721 "(
  record {
    logo_type=\"image/jpg\"; 
    data=\"$LOGO_BASE64\";
  })"

  printf "\n\n"
}

seticdev() {
  printf "Setting Logo\n"
  printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"

  dfx canister --networkc ic --no-wallet call nft setLogoDip721 "(
  record {
    logo_type=\"image/jpg\";
    data=\"$LOGO_BASE64\";
  })"

  printf "\n\n"
}

setlocal

exit 0