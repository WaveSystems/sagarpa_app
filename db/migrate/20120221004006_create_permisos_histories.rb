class CreatePermisosHistories < ActiveRecord::Migration
  def up
    create_table :permisos_histories do |t|

      t.timestamps
    end
  end
  def down
    drop_table :permisos_histories
  end
end
