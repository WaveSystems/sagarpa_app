class CreatePermisoPernocta < ActiveRecord::Migration
  def change
    create_table :permiso_pernocta do |t|
      t.integer       :auto_id
      t.string        :justificacion
      t.string        :observaciones
      t.datetime      :fecha_hora_salida
      t.datetime      :fecha_hora_llegada
      t.string        :domicilio_pernocta
      t.integer       :num_oficio
      t.integer       :solicita_id
      t.integer       :VoBo_id
      t.string        :tramito
      t.string        :autorizo
      t.timestamps
    end
  end
end
