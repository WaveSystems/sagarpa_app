ActiveAdmin.register Area do
  index do |f|
    f.column :id
    f.column :nombre
    f.column :jefe_id
    f.column :num_personal
    f.column :num_vehiculos
    default_actions
  end
  
end
