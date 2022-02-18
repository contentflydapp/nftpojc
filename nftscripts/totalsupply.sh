#!/bin/sh -l



localtotalsupply() {
  printf "Checking local NFT total supply\n\n"
  dfx canister call nft totalSupplyDip721 --query
}

icdevtotalsupply() {
  printf "Checking NFT total supply\n\n"
  dfx canister  --network ic call nft totalSupplyDip721 --query
}

icdevtotalsupply


exit 0