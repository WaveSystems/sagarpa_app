ActiveAdmin.register Vehiculo do
  form do |f|
    f.inputs "Vehiculo" do
      f.input :numero, :label => "No."
      f.input :responsable_id, :label => "ID Responsable"
      f.input :area_id, :label => "ID area"
      f.input :brand
      f.input :tipo
      f.input :cilindros
      f.input :placa_actual
      f.input :year, :label => "Modelo"
      f.input :color
      f.input :identificacion, :label => "No Idenfificacion"
    end
    f.buttons
  end

  index do |f|
    f.column :numero, :label => "No."
    f.column :responsable_id, :label => "ID Responsable"
    f.column :area_id, :label => "ID area"
    f.column :brand
    f.column :tipo
    f.column :cilindros
    f.column :placa_actual
    f.column :year, :label => "Modelo"
    f.column :color
    f.column :identificacion, :label => "No Idenfificacion"
    f.column :estado
    default_actions
  end

end
