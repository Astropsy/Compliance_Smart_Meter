module meter_data_validator

use aiken/transaction.{ScriptContext}
use Types

validator meter_data_validator {

  fn spend(reading: Types.MeterReading, redeemer: Data, context: ScriptContext) -> Bool {
    // Device ID must not be empty
    let valid_device = reading.device_id != #"" 

    // Reading must be positive
    let valid_energy = reading.kwh_milli > 0

    valid_device && valid_energy
  }
}