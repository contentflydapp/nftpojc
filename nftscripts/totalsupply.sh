#!/bin/sh -l



localtotalsupply() {
  printf "Checking local NFT total supply\n\n"
  dfx canister call nft totalSupplyDip721 --query
}

ictotalsupply() {
  printf "Checking NFT total supply\n\n"
  dfx canister  --network ic call nft totalSupplyDip721 --query
}

localtotalsupply

exit 0