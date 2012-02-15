class AddColumnsToVehiculos < ActiveRecord::Migration
  def change
    add_column :vehiculos, :estado, :string
  end
end
