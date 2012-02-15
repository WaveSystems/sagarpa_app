class VehiculosEngineObserver < ActiveRecord::Observer
  observe :permiso_pernocta
  observe :permiso_diario
end
