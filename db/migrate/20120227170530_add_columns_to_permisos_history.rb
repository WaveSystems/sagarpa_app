class AddColumnsToPermisosHistory < ActiveRecord::Migration
  def up
    add_column :permisos_histories, :difference, :time
  end

  def down
    remove_column :permisos_histories, :difference
  end
end
