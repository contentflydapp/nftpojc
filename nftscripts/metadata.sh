#!/bin/sh -l
printf "Checking NFT metadata of token: \n"
printf "\n\n"

metaicdev() {
  dfx canister --network ic call nft getMetadataDip721 '(4)' --query
}

metalocal() {
  dfx canister call nft getMetadataDip721 '(10)' --query
}

metalocal

exit 0