// cardano/offchain-sdk/utils.ts
// Small helpers used across the SDK.

export interface MeterReading {
  deviceId: string;     // hex or bech32-encoded bytes
  kwhMilli: bigint;     // milli-kWh
}

export interface TxBuildResult {
  cborHex: string;      // serialized tx body
}

/**
 * Simple helper to log steps in a consistent way.
 */
export function logStep(step: string, details?: unknown) {
  if (details !== undefined) {
    console.log(`[ComplianceSDK] ${step}`, details);
  } else {
    console.log(`[ComplianceSDK] ${step}`);
  }
}

/**
 * Placeholder for turning a MeterReading into a datum.
 * In a real implementation this will match the Aiken Types.MeterReading.
 */
export function readingToDatum(reading: MeterReading): unknown {
  return {
    device_id: reading.deviceId,
    kwh_milli: reading.kwhMilli.toString(),
  };
}