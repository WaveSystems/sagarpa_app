class VehiculosEngineObserver < ActiveRecord::Observer
  observe :permiso_pernocta
  observe :permiso_diario
  
  def after_save(permiso)
    if  @vehiculo = Vehiculo.find(permiso.auto_id).estado == "Disponible" && permiso.estado == "Autorizado"
      Vehiculo.estado = "No disponible"
    end
  end
end
