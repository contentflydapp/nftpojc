#!/bin/sh -l

printf "Checking NFT metadata of token: \n"
printf "\n\n"

dfx canister --no-wallet --network ic call nft getMetadataDip721 '(1)' --query  --type idl