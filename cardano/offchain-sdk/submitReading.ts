// cardano/offchain-sdk/submitReading.ts
// Entry point used by the cloud backend to push readings on-chain.

import { buildReadingTx } from "./buildTx";
import { MeterReading, logStep } from "./utils";

/**
 * Submit a verified meter reading to Cardano.
 * For now this function only builds the tx and logs it.
 * Later: sign & submit via wallet or backend key.
 */
export async function submitReading(
  reading: MeterReading,
  fromAddress: string,
): Promise<void> {
  logStep("submitReading() called", { reading, fromAddress });

  const tx = await buildReadingTx(reading, fromAddress);

  // TODO:
  //  - sign tx.cborHex with backend key or wallet
  //  - POST to cardano node or wallet backend
  logStep("Reading tx built (not yet submitted)", { cbor: tx.cborHex });
}