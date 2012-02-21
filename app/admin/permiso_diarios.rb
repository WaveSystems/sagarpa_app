ActiveAdmin.register PermisoDiario do

  index do |f|
    f.column :id
    f.column :auto_id
    f.column :justificacion
    f.column :observaciones
    f.column :fecha
    f.column :hora_salida
    f.column :hora_llegada
    f.column :solicita_id
    f.column :jefe_id
    f.column :estado
    f.column :autorizo
    default_actions
  end
  
end
