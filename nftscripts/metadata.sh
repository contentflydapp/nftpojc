#!/bin/sh -l
WALLET_ACCOUNT_PRINCIPAL="y3rpf-g74cl-bv6dy-7wsan-cv4cp-ofrsm-ubgyo-mmxfg-lgwp4-pdm4x-nqe"
WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
WALLET_ACCOUNT_DEV_PRINCIPAL="xifbj-tqaaa-aaaaa-aaauq-cai"

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