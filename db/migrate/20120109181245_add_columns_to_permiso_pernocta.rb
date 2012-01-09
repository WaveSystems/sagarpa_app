class AddColumnsToPermisoPernocta < ActiveRecord::Migration
  def change
    add_column :permiso_pernocta, :user_id, :integer
  end
end
