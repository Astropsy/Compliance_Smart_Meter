// cardano/offchain-sdk/cardanoConfig.ts
// Central place for network + script config.

export type NetworkId = "preprod" | "mainnet" | "preview";

export interface CardanoConfig {
  network: NetworkId;
  nodeUrl: string;
  meterDataScriptHash: string;
  mintLogicPolicyId: string;
  deviceRegistryScriptHash: string;
  p2pMarketplaceScriptHash: string;
}

export const config: CardanoConfig = {
  network: "preprod",
  nodeUrl: "https://preprod-node.example.com", // TODO: replace
  meterDataScriptHash: "METER_DATA_HASH_HERE",
  mintLogicPolicyId: "MINT_POLICY_ID_HERE",
  deviceRegistryScriptHash: "DEVICE_REGISTRY_HASH_HERE",
  p2pMarketplaceScriptHash: "P2P_MARKETPLACE_HASH_HERE",
};