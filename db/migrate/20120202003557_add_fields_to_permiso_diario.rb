class AddFieldsToPermisoDiario < ActiveRecord::Migration
  def change
    add_column :permiso_diarios, :estado, :string
  end
end
