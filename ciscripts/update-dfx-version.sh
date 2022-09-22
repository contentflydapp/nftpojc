#!/usr/bin/env bash

echo Upgrade dfx
sed s/'"dfx": "0.8.1"'/'"dfx": "0.8.4"'/g ./cap/dfx.json > ./cap/new-dfx.json

cp ./cap/new-dfx.json ./cap/dfx.json
rm ./cap/new-dfx.json