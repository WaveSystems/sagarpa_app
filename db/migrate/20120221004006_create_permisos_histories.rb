class CreatePermisosHistories < ActiveRecord::Migration
  def change
    create_table :permisos_histories do |t|

      t.timestamps
    end
  end
end
