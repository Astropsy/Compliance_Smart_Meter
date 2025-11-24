#!/bin/bash
# Deploy compiled Plutus scripts to Cardano testnet (MVP placeholder)

set -e

echo "[deploy-testnet] Checking for compiled scripts..."

if [ ! -d "../plutus_scripts" ]; then
  echo "plutus_scripts/ folder not found. Run 'aiken build' first."
  exit 1
fi

echo "[deploy-testnet] Scripts ready:"
ls ../plutus_scripts

echo ""
echo "[deploy-testnet] Building simple funding transaction..."

# NOTE: Replace with actual UTxO and address
FROM_ADDR=$(cat payment.addr)
TX_IN="REPLACE_WITH_UTXO#0"

# Dummy output to show intent
cardano-cli transaction build \
  --testnet-magic 1 \
  --tx-in $TX_IN \
  --tx-out "$FROM_ADDR+2000000" \
  --change-address $FROM_ADDR \
  --out-file deploy.tx

echo "[deploy-testnet] Signing..."
cardano-cli transaction sign \
  --tx-body-file deploy.tx \
  --signing-key-file payment.skey \
  --testnet-magic 1 \
  --out-file deploy.signed

echo "[deploy-testnet] Submitting..."
cardano-cli transaction submit \
  --testnet-magic 1 \
  --tx-file deploy.signed

echo "[deploy-testnet] Deployment flow complete."
