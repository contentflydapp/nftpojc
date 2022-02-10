#!/bin/sh -l

WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
WALLET_ACCOUNT_DEV_PRINCIPAL="r7inp-6aaaa-aaaaa-aaabq-cai"

printf "Checking NFT metadata of token: \n"
printf "\n\n"

metaicdev() {
  dfx canister --no-wallet --network ic call nft getMetadataDip721 '(1)' --query
}

metalocal() {
  dfx canister --no-wallet call nft getMetadataDip721 '(1)' --query
}

metalocal

exit 0