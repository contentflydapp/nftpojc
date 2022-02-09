#!/bin/sh -l

WALLET_ACCOUNT_PRINCIPAL="y3rpf-g74cl-bv6dy-7wsan-cv4cp-ofrsm-ubgyo-mmxfg-lgwp4-pdm4x-nqe"
WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
WALLET_ACCOUNT_DEV_PRINCIPAL="r7inp-6aaaa-aaaaa-aaabq-cai"

printf "Minting NFT to: $WALLET_ACCOUNT_DEV_PRINCIPAL\n"
printf "Identity: $(dfx identity whoami)\n"

# dfx canister --no-wallet --network ic call nft mintDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\", vec{})"

dfx canister --no-wallet call nft mintDip721 "(principal \"$WALLET_ACCOUNT_DEV_PRINCIPAL\", vec{})"

# dfx canister --network ic --no-wallet call nft mintDip721 "(principal \"$WALLET_ACCOUNT2_PRINCIPAL\", vec{
#   record { 
#     purpose=variant { Preview };
#     key_val_data=vec {
#       record {
#         key=\"name\";
#         val=variant { TextContent = \"Content Fly PoJC NFT\" };
#       }
#     };
#     data=blob \"\"
#   }
# })"