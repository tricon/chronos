class CreateDriveDates < ActiveRecord::Migration
  def change
    create_table :drive_dates do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :drive, index: true

      t.timestamps
    end
  end
end
