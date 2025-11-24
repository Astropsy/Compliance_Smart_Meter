use aiken/transaction.{ScriptContext}
use Types

validator meter_data_validator {
  fn spend(reading: Types.MeterReading, redeemer: Data, context: ScriptContext) -> Bool {
    let valid_device = reading.device_id != #""
    let valid_energy = reading.kwh_milli > 0
    valid_device && valid_energy
  }
}