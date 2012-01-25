class RemoveColumnVehiculos < ActiveRecord::Migration
  def up
    remove_column :vehiculos, :marca
  end

  def down
  end
end
