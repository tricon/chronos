class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :name, null: false
      t.text :description
      t.string :recurs_every, null: false
      t.integer :appointments_available_per_slot

      t.timestamps
    end
  end
end
