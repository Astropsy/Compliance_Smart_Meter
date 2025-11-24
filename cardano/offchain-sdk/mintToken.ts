// cardano/offchain-sdk/mintToken.ts
// High level helper for minting the compliance / reward token.

import { buildMintTx } from "./buildTx";
import { logStep } from "./utils";

/**
 * Mint a given quantity of compliance tokens to an address.
 * Quantity is in smallest unit (e.g. lovelace like, depends on policy).
 */
export async function mintTokens(
  quantity: bigint,
  toAddress: string,
): Promise<void> {
  logStep("mintTokens() called", {
    quantity: quantity.toString(),
    toAddress,
  });

  const tx = await buildMintTx(quantity, toAddress);

  // TODO:
  //  - sign tx.cborHex
  //  - submit to network
  logStep("Mint tx built (not yet submitted)", { cbor: tx.cborHex });
}