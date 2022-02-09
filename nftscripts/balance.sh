#!/bin/sh -l

WALLET_ACCOUNT_PRINCIPAL="y3rpf-g74cl-bv6dy-7wsan-cv4cp-ofrsm-ubgyo-mmxfg-lgwp4-pdm4x-nqe"
WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
WALLET_ACCOUNT_DEV_PRINCIPAL="r7inp-6aaaa-aaaaa-aaabq-cai"

printf "Checking NFT balance of account: $WALLET_ACCOUNT2_PRINCIPAL\n\n"

# dfx canister --no-wallet --network ic call nft balanceOfDip721 "(principal \"$WALLET_ACCOUNT2_PRINCIPAL\")" --query

dfx canister --no-wallet call nft balanceOfDip721 "(principal \"$WALLET_ACCOUNT_DEV_PRINCIPAL\")" --query