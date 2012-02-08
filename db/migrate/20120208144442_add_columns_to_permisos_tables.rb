class AddColumnsToPermisosTables < ActiveRecord::Migration
  def self.up
    add_column :permiso_diarios, :autorizo, :string
    remove_column :permiso_diarios, :autorizo_id
  end
  def self.down
    remove_column :permiso_diarios, :autorizo, :string
  end
end
