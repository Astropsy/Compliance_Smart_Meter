#!/bin/bash
# Create Cardano payment + stake keys and addresses (MVP placeholder)

set -e

echo "[create-addresses] Generating payment and stake keys..."

# Payment keys
cardano-cli address key-gen \
  --verification-key-file payment.vkey \
  --signing-key-file payment.skey

# Stake keys
cardano-cli stake-address key-gen \
  --verification-key-file stake.vkey \
  --signing-key-file stake.skey

# Build payment address
cardano-cli address build \
  --payment-verification-key-file payment.vkey \
  --stake-verification-key-file stake.vkey \
  --testnet-magic 1 \
  --out-file payment.addr

echo "[create-addresses] Done. Files created:"
echo "  payment.vkey"
echo "  payment.skey"
echo "  stake.vkey"
echo "  stake.skey"
echo "  payment.addr"
