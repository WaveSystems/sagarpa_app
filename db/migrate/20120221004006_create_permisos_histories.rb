class CreatePermisosHistories < ActiveRecord::Migration
  def up
    create_table :permisos_histories do |t|
      t.string :event
      t.integer :permiso_id
      t.string:tipo_permiso
      t.integer :auto_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
    drop_table :permisos_histories
  end
end
