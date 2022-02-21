# 🚀 Content Fly Proof of Job Completion (PoJC) NFT

Content Fly PoJC NFT Token follows the [DIP721 standard](https://github.com/Psychedelic/DIP721/blob/develop/spec.md). It is a fork of [DIP721](https://github.com/Psychedelic/DIP721/)

DIP-721 is an ERC-721 style non-fungible token standard built mirroring its Ethereum counterpart and adapting it to the Internet Computer, maintaining the same interface.

This standard aims to adopt the EIP-721 to the Internet Computer; providing a simple, non-ambiguous, extendable API for the transfer and tracking ownership of NFTs and expanding/building upon the EXT standard with partial compatibility.

# Why DIP721?

DIP721 is chosen because:

- It simplifies and enhances the EXT standard.
- It is supported in Plug Wallet so users can actually see it in their wallets.
- It has basic integration with [CAP](https://cap.ooo/) for transaction history and asset provenance.
- It is under active development and will continue to evolve.

# Enhancements (updated on 21st Feb 2022)

- Added store and restore CAP data in Canister preupgrade and postupgrade so that it will survive future canister upgrade, otherwise future mint after Canister upgrade (with integration to CAP) will fail because it lost the CAP root canister id reference info created during init handshake
- Added Github Action workflow for deployment to Internet Computer and running basic healtch check testing with NFT canister
- Added CI scripts /ciscripts and NFT scripts /nftscripts for running common cmds on local DFX or IC network
- Implemented logoDip721 with LogoResult response
- Added setLogoDip721 for controller only
- Added a separate dfx-dev.json DFX 0.9.0 for running with other local Canisters that have upgraded to 0.9.0 (that has significant changes on --no-wallet flag)
- Added dfx-prod.json for DFX 0.8.4 used for CAP install and deploy

# Active Branch

Currently, **develop** is the Git branch under active development. It is used for local development and deployment to IC network. That can change in the future.

# Getting Started

If you use dfx 0.9.0, switch to dfx-dev.json:

```
cp dfx-dev.json dfx.json

```

All scripts in /nftscripts are for dfx 0.9.0.

## To build and run this locally:

You will need:

- NodeJS 16+
- DFX SDK 0.9.0
- Rust Toolchain
- ICX command from dfx agent
- IC CDK Optimizer

Install Rust Toolchain

```
rustup install stable && rustup default stable && rustup target add wasm32-unknown-unknown
```

Install agent-rust for icx command

```
git clone https://github.com/dfinity/agent-rust.git && cd agent-rust && cargo build
```

Install IC CDK Optimizer

```
cargo install ic-cdk-optimizer
```

Start DFX local server

```
dfx start --background
```

Start CAP

```
npm cap:init
npm run cap:start
```

Deploy NFT and run healtcheck

```
npm run dip721:healthcheck
```

# Future Plan

This NFT Canister is under active development by Content Fly team. The controller of the Canister is Content Fly team. In the future, it will be made immutable and sent to black hole with empty controller when all the major features are implemented.

# License

Content Fly PoJC NFT - [MIT License](LICENSE)
