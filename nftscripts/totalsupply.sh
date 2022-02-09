#!/bin/sh -l


printf "Checking NFT total supply\n\n"

dfx canister --no-wallet --network ic call nft totalSupplyDip721 --query