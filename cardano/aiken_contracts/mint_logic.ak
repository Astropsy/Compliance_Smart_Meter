module mint_logic

use aiken/transaction.{ScriptContext}
use aiken/builtin

/**
 * Minimal minting policy.
 * For MVP we only enforce that the backend signs the minting transaction.
 * Full rules (energy thresholds, aggregation, etc.) will be added later.
 */

validator mint_logic {

  fn mint(redeemer: Data, context: ScriptContext) -> Bool {
    // We require at least one expected signer (backend key).
    // We will replace "BACKEND_PUBKEY_HASH" with real hash later.
    let required = "BACKEND_PUBKEY_HASH"

    builtin.contains_list(
      context.transaction.signatories,
      required
    )
  }
}