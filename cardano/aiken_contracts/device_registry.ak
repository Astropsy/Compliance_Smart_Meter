use aiken/transaction.{ScriptContext}
use aiken/builtin
use Types

validator device_registry {
  fn spend(device: Types.Device, redeemer: Data, context: ScriptContext) -> Bool {
    let required = "BACKEND_PUBKEY_HASH"
    builtin.contains_list(context.transaction.signatories, required)
  }
}