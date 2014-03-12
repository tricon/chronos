class CreateDriveLocations < ActiveRecord::Migration
  def change
    create_table :drive_locations do |t|
      t.string :name
      t.string :address
      t.string :address_extended
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.references :drive, index: true

      t.timestamps
    end
  end
end
