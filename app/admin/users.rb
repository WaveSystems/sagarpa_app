ActiveAdmin.register User do
  form do |f|
    f.inputs "Usuario" do
      f.input :nombre
      f.input :email
      f.input :password
      f.input :area_id, :as => :select, :collection => Area.get_areas
      f.input :autorizado, :as => :radio, :collection => User::AUTORIZADO
      f.input :tipo, :as => :radio, :collection => User::TIPOS
    end
    f.buttons
  end  
  index do |f|
    f.column :id
    f.column :nombre
    f.column :email
    f.column :area_id
    f.column :autorizado
    f.column :tipo
    default_actions
  end
end
