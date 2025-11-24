module device_registry

use aiken/transaction.{ScriptContext}
use aiken/builtin
use Types

validator device_registry {

  fn spend(datum: Types.Device, redeemer: Data, context: ScriptContext) -> Bool {
    let required_signer = "BACKEND_PUBKEY_HASH to be replaced with a real value"

    builtin.contains_list(
      context.transaction.signatories,
      required_signer
    )
  }
}
