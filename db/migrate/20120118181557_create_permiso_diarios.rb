class CreatePermisoDiarios < ActiveRecord::Migration
  def change
    create_table :permiso_diarios do |t|

      t.timestamps
    end
  end
end
