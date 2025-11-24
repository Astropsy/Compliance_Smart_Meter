use aiken/transaction.{ScriptContext}
use aiken/builtin

minting_policy mint_logic {
  fn mint(redeemer: Data, context: ScriptContext) -> Bool {
    let required = "BACKEND_PUBKEY_HASH"
    builtin.contains_list(context.transaction.signatories, required)
  }
}