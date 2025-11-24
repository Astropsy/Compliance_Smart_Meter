use aiken/transaction.{ScriptContext}
use aiken/builtin
use Types

validator p2p_marketplace {
  fn spend(req: Types.Request, redeemer: Data, context: ScriptContext) -> Bool {
    builtin.contains_list(context.transaction.signatories, req.requester)
  }
}