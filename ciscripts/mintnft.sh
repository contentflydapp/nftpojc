#!/bin/sh -l

WALLET_ACCOUNT_PRINCIPAL="y3rpf-g74cl-bv6dy-7wsan-cv4cp-ofrsm-ubgyo-mmxfg-lgwp4-pdm4x-nqe"
WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
# WALLET_ACCOUNT_PRINCIPAL="r7inp-6aaaa-aaaaa-aaabq-cai"

printf "Minting NFT to: $WALLET_ACCOUNT2_PRINCIPAL\n"
printf "My Identity: ${dfx identity whoami}\n"
printf "\n"

dfx canister --no-wallet --network ic call nft mintDip721 "(principal \"$WALLET_ACCOUNT2_PRINCIPAL\", vec{})"

# NftID=$(dfx canister --network ic id nft)
# DefaultPem="$HOME/.config/dfx/identity/icdev/identity.pem"
# NftCandidFile="./nft/candid/nft.did"
# IcxPrologueNft="--candid=${NftCandidFile}"

# printf "NftID=$NftID, DefaultPem=$DefaultPem\n\n"

# icx --pem="$DefaultPem" update "$NftID" mintDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\", vec{})" "$IcxPrologueNft"