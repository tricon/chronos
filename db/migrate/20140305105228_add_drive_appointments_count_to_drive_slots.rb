class AddDriveAppointmentsCountToDriveSlots < ActiveRecord::Migration
  def change
    add_column :drive_slots, :drive_appointments_count, :integer, null: false, default: 0
  end
end