// Start by importing the CapRouter instance
// a CapRoot is also available for Root bucket methods
// See CAP Candid/IDL's (https://github.com/Psychedelic/cap)
const { CapRouter, CapRoot } = require('@psychedelic/cap-js');

// The Principal is required to handle
// the principal object type which is passed
// to the CapRouter method(s)
// e.g. Principal is an object and not a string
const { Principal } = require('@dfinity/principal');

// The mainnet address
const mainnet = 'https://ic0.app/';

// The Router canister id
const routerCanisterId = 'lj532-6iaaa-aaaah-qcc7a-cai';

// The Management Canister is `aaaaa-aa`
// the default Principal falls back to
const managementCanisterPrincipal = Principal.fromHex('');

const nftCanisterId = 'x6avo-fqaaa-aaaah-qcuiq-cai';

// On a hypotetical application top-level or entry-point
(async () => {
  let capRouter;

  try {
    // Call `init` to create an instance of CapRouter
    // the CapRouter instance can be used throughout the application lifetime
    // e.g. if you instantiate it at the top-level, you can reuse it
    // because the canister id does not need to be updated (common use-cases)
    capRouter = await CapRouter.init({
      host: mainnet,
      canisterId: routerCanisterId,
    });
  } catch (err) {
    console.warn('Oops! Failed to initiate the CapRouter');
    console.error(err);
  }

  if (typeof capRouter.get_token_contract_root_bucket !== 'function') {
    throw Error('Oops! Unexpected Cap Router instance...');
  }

  // Get history root canister id for the NFT token canister
  const { witness, canister } = await capRouter.get_token_contract_root_bucket({
    tokenId: Principal.fromText(nftCanisterId),
  });

  const historyCanisterId = canister[0].toText();

  console.info(
    `Yay History Canister Id for NFT Token ${nftCanisterId}: ${historyCanisterId}`
  );
})();
