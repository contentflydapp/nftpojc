#!/bin/sh -l

localbalance() {
  printf "Checking NFT balance of account: $WALLET_ACCOUNT_PRINCIPAL\n\n"
  dfx canister  call nft balanceOfDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\")" --query
}

icbalance() {
  printf "Checking NFT balance of account: $WALLET_ACCOUNT_PRINCIPAL\n\n"
  dfx canister  --network ic call nft balanceOfDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\")" --query
}

icbalance

exit 0
