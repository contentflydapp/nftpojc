#!/bin/sh -l
WALLET_ACCOUNT_PRINCIPAL="y3rpf-g74cl-bv6dy-7wsan-cv4cp-ofrsm-ubgyo-mmxfg-lgwp4-pdm4x-nqe"
WALLET_ACCOUNT2_PRINCIPAL="felbv-vy72c-jx5nl-2gmpw-wyvlb-5rbpq-b7hdq-gdm7b-xowff-cspse-iae"
WALLET_ACCOUNT_DEV_PRINCIPAL="xifbj-tqaaa-aaaaa-aaauq-cai"

printf "Identity: $(dfx identity whoami)\n"

mintlocal() {
  printf "Minting NFT to: $WALLET_ACCOUNT_DEV_PRINCIPAL\n"

  dfx canister call nft mintDip721 "(principal \"$WALLET_ACCOUNT_DEV_PRINCIPAL\", vec{
    record { 
      purpose=variant { Preview };
      data=blob \"\";
      key_val_data=vec {
        record {
          key=\"name\";
          val=variant { TextContent = \"Content Fly PoJC NFT\" };
        }
      }
    }
  })"
}

minticdev() {
  printf "Minting NFT to: $WALLET_ACCOUNT_PRINCIPAL\n"

  dfx canister --network ic call nft mintDip721 "(principal \"$WALLET_ACCOUNT_PRINCIPAL\", vec{
    record { 
      purpose=variant { Preview };
      data=blob \"\";
      key_val_data=vec {
        record {
          key=\"name\";
          val=variant { TextContent = \"Content Fly PoJC NFT\" };
        }
      }
    }
  })"
}

mintlocal

exit 0