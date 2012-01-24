class AddColumnsToPermisoDiarios < ActiveRecord::Migration
  def change
    add_column :permiso_diarios, :auto_id, :integer
    add_column :permiso_diarios, :justificacion, :string
    add_column :permiso_diarios, :observaciones, :string
    add_column :permiso_diarios, :fecha, :date
    add_column :permiso_diarios, :hora_salida, :time
    add_column :permiso_diarios, :hora_llegada, :time
    add_column :permiso_diarios, :solicita_id, :integer
    add_column :permiso_diarios, :jefe_id, :integer
    add_column :permiso_diarios, :autorizo_id, :integer
  end
end
