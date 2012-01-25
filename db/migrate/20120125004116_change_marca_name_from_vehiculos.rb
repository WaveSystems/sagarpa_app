class ChangeMarcaNameFromVehiculos < ActiveRecord::Migration
  def down
    add_column :vehiculos, :marca
  end

  def up
    add_column :vehiculos, :brand, :string
  end
end
