class AddFieldsToPermisoPernocta < ActiveRecord::Migration
  def change
    add_column :permiso_pernocta, :estado, :string
  end
end
