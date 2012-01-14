ActiveAdmin.register Area do
  index do |f|
    f.column :id
    f.column :nombre
    f.column :jefe_id
    f.column :num_personal
    f.column :num_vehiculos
    default_actions
  end
  
  form do |f|
    f.inputs "Area" do
      f.input :nombre
      f.input :jefe_id, :label => "Jefe"
      f.input :num_personal
      f.input :num_vehiculos
    end
    f.buttons
  end
end
