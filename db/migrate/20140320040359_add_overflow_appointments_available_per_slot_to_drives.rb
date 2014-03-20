class AddOverflowAppointmentsAvailablePerSlotToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :overflow_appointments_available_per_slot, :integer, null: false, default: 0
  end
end
