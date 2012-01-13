class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string    :nombre
      t.integer   :jefe_id
      t.integer   :num_personal
      t.integer   :num_vehiculos
      t.timestamps
    end
  end
end
