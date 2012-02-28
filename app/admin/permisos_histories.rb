ActiveAdmin.register PermisosHistory do
  
  filter :tipo_permiso, :as => :select, :collection => proc {PermisosHistory::TIPOS}

  index do |t|
    t.column :id
    t.column :event
    t.column :tipo_permiso
    t.column :difference
  end
  
end
