module Types {

  const GRID_DENSITY_MICRO_KG_PER_KWH : Int = 400_000
  const MILLI_PER_KWH : Int = 1_000
  const KWH_PER_TOKEN_MILLI : Int = 2_500

  type Device {
    device_id: ByteArray,
    wallet: ByteArray,
    total_kwh_milli: Int,
    total_co2_micro_kg: Int,
    active: Bool
  }

  type MeterReading {
    device_id: ByteArray,
    kwh_milli: Int
  }

  type Request {
    requester: ByteArray,
    device_id: ByteArray,
    max_price_lovelace: Int
  }
}