class AddColumnToVehiculos < ActiveRecord::Migration
  def change
    add_column :vehiculos, :area_id, :integer
  end
end
