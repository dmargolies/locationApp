class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :route
      t.text :details

      t.timestamps
    end
  end
end
