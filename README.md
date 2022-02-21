# 🚀 Content Fly Proof of Job Completion (PoJC) NFT

Content Fly PoJC follows the [DIP721 standard](https://github.com/Psychedelic/DIP721/blob/develop/spec.md). It is a fork of [DIP721](https://github.com/Psychedelic/DIP721/)

DIP-721 is an ERC-721 style non-fungible token standard built mirroring its Ethereum counterpart and adapting it to the Internet Computer, maintaining the same interface.

This standard aims to adopt the EIP-721 to the Internet Computer; providing a simple, non-ambiguous, extendable API for the transfer and tracking ownership of NFTs and expanding/building upon the EXT standard with partial compatibility.

# Why DIP721?

DIP721 is chosen for implement PoJC NFT because:

- It simplifies and enhances the EXT standard.
- It is supported in Plug Wallet so users can actually see it in their wallets.
- It has basic integration with [CAP](https://cap.ooo/) for transaction history and asset provenance.
- It is under active development and will continue to evolve.

# Enhancements (updated on 21st Feb 2022)

- Added Github Action workflow for deployment to Internet Computer and running basic healtch check testing with NFT canister
- Added CI scripts /ciscripts and NFT scripts /nftscripts for running common cmds on local DFX or IC network
- Implemented logoDip721 with LogoResult response
- Added setLogoDip721 for controller only
- Add a separate dfx-dev.json DFX 0.9.0 for running with other local Canisters that have upgraded to 0.9.0 (that has significant changes on --no-wallet flag)
- Add dfx-prod.json for DFX 0.8.4 used for CAP install and deploy

# Active Branch

Currently, the active Git branch is develop for local development and deployment to IC network. That can change in the future.

# Get Started

# License

Content Fly PoJC NFT - [MIT License](LICENSE)
