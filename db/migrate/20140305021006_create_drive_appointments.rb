class CreateDriveAppointments < ActiveRecord::Migration
  def change
    create_table :drive_appointments do |t|
      t.references :drive_slot, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
