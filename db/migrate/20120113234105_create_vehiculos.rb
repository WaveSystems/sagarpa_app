class CreateVehiculos < ActiveRecord::Migration
  def change
    create_table :vehiculos do |t|
      t.integer     :numero
      t.string      :responsable_id
      t.integer     :marca
      t.string      :tipo
      t.integer     :cilindros
      t.string      :placa_actual
      t.string      :year
      t.string      :color
      t.integer     :identificacion
      t.timestamps
    end
  end
end
