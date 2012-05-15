class AddLocationToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :location_id, :integer
  end
end
