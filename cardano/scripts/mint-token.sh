#!/bin/bash
# Mint compliance tokens using the mint_logic policy (MVP placeholder)

set -e

POLICY_SCRIPT="../plutus_scripts/mint_logic.plutus"
POLICY_ID="REPLACE_WITH_POLICY_ID"   # TODO: cardano-cli transaction policyid --script-file $POLICY_SCRIPT
TO_ADDR_FILE="payment.addr"
SIGNING_KEY="payment.skey"
NETWORK_MAGIC=1                      # preprod testnet

if [ ! -f "$POLICY_SCRIPT" ]; then
  echo "[mint-token] Policy script not found at $POLICY_SCRIPT"
  echo "Run 'aiken build' first."
  exit 1
fi

if [ ! -f "$TO_ADDR_FILE" ]; then
  echo "[mint-token] payment.addr not found. Run create-addresses.sh first."
  exit 1
fi

TO_ADDR=$(cat "$TO_ADDR_FILE")

if [ -z "$1" ]; then
  echo "Usage: ./mint-token.sh <amount>"
  echo "Example: ./mint-token.sh 1000"
  exit 1
fi

AMOUNT="$1"
ASSET_NAME="COMPLIANCE"              # token name, can be changed
FULL_ASSET="${AMOUNT} ${POLICY_ID}.${ASSET_NAME}"

echo "[mint-token] Minting ${FULL_ASSET} to ${TO_ADDR}"

TX_IN="REPLACE_WITH_UTXO#0"          # TODO: update with real UTxO

cardano-cli transaction build \
  --testnet-magic $NETWORK_MAGIC \
  --tx-in $TX_IN \
  --tx-out "$TO_ADDR+2000000 + ${FULL_ASSET}" \
  --mint "${FULL_ASSET}" \
  --mint-script-file "$POLICY_SCRIPT" \
  --change-address "$TO_ADDR" \
  --out-file mint.raw

cardano-cli transaction sign \
  --tx-body-file mint.raw \
  --signing-key-file "$SIGNING_KEY" \
  --testnet-magic $NETWORK_MAGIC \
  --out-file mint.signed

cardano-cli transaction submit \
  --testnet-magic $NETWORK_MAGIC \
  --tx-file mint.signed

echo "[mint-token] Mint transaction submitted."
