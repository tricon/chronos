class CreateDriveSlots < ActiveRecord::Migration
  def change
    create_table :drive_slots do |t|
      t.datetime :slot_at
      t.references :drive, index: true

      t.timestamps
    end
  end
end
