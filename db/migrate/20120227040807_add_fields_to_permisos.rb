class AddFieldsToPermisos < ActiveRecord::Migration
  def up
    add_column :permiso_diarios, :tipo, :string
    add_column :permiso_pernocta, :tipo, :string
  end

  def down
    remove_column :permiso_diarios, :tipo
    remove_column :permiso_pernocta, :tipo
  end
end
