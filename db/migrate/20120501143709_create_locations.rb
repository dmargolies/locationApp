class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :longitude
      t.string :latitude
      t.text :details
      t.references :vehicle

      t.timestamps
    end
    add_index :locations, :vehicle_id
  end
end
