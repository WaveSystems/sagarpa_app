ActiveAdmin.register PermisoPernocta do

  filter :solicita_id,:as => :select, :collection => proc { User.get_users }
  filter :auto_id ,:as => :select, :collection => proc { Vehiculo.get_vehiculos }
  filter :fecha_hora_salida

  form do |f|
    f.inputs "Permiso de Pernocta" do
      f.input :auto_id
      f.input :justificacion
      f.input :observaciones
      f.input :fecha_hora_salida
      f.input :fecha_hora_llegada
      f.input :domicilio_pernocta
      f.input :num_oficio
      f.input :solicita_id, :as => :select, :collection => User.all
      f.input :VoBo_id
      f.input :tramito
      f.input :autorizo
    end
    f.buttons
  end

  index do |f|
    f.column :id
    f.column :auto_id
    f.column :justificacion
    f.column :observaciones
    f.column :fecha_hora_salida
    f.column :fecha_hora_llegada
    f.column :domicilio_pernocta
    f.column :num_oficio
    f.column :solicita_id
    f.column :VoBo_id
    f.column :tramito
    f.column :autorizo
    f.column :estado
    default_actions
  end
end
