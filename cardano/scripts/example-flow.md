This file shows the flow of data from the smart meter device to the Cardano blockchain.

ESP32 → Cloud → submitReading.ts → buildTx.ts → Aiken validator → Cardano testnet

# Compliance Smart Meter – Example Data Flow and Tamper Proof Pipeline

This shows the end-to-end, tamper proof path for a verified energy reading going from the physical meter to the Cardano blockchain.

## 1. Smart Meter (ESP32 Device)
- Measures milli-kWh.
- Signs: `device_id + reading + timestamp` using Ed25519.
- Broadcasts private WiFi AP for onboarding.
- No app download required; secure local webpage only.

## 2. Local User Session (Browser → Device)
- User connects to device AP.
- Local webpage verifies device signature.
- User logs in (email/SSO/password).
- System creates a secure embedded wallet.
- Device is bound to user/site account.

## 3. Cloud Ingestion (AWS)
- ESP32 reading is sent securely to AWS IoT.
- Signature verified again server-side.
- LLM performs:
  - data cleaning  
  - unit normalization  
  - anomaly detection  
  - anti fraud checks  
- Cleaned reading is packaged for on-chain usage.

## 4. Off-Chain SDK (submitReading.ts → buildTx.ts)
- `submitReading.ts` receives the cleaned reading.
- Converts it to a `MeterReading` datum.
- Calls `buildReadingTx()` which:
  - selects UTxOs  
  - creates script output for `meter_data_validator`  
  - attaches datum  
  - prepares change output  

## 5. Backend Signing
- Backend signs the transaction using its payment key.
- Transaction is submitted to Cardano preprod testnet.

## 6. Aiken Validator Execution
- `meter_data_validator.ak` runs:
  - checks reading structure  
  - checks kWh > 0  
  - verifies datum integrity  

## 7. Token Minting: mintToken.ts → mint_logic.ak
- Off-chain logic adds up the verified readings from each producer
- When the threshold is reached, currently 2.5 kWh per token, `mintToken.ts`implements the following:
  - builds a minting transaction using `mint_logic.ak`
  - sends newly minted tokens to the energy producer wallet address.

## Output
Compliance tokens are minted and sent to the energy producers wallet, backed by tamper proof, LLM cleaned, anti fraud checked energy readings recorded on Cardano.
