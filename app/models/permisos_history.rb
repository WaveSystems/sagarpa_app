class PermisosHistory < ActiveRecord::Base
  def self.register(permiso)
    vehiculo = Vehiculo.get_vehiculo_permiso(permiso.auto_id)
    solicitante = User.get_solicitante(permiso.solicitante_id)
    self.event = "Registrada la entrada de #{vehiculo} a las #{Time.now.hour}:#{Time.now.min} el #{Time.now.day}/#{Time.now.month}/#{Time.now.year}, permiso #{permiso.id}, por #{solicitante}"
    self.permiso_id = permiso.id
    self.auto_id = permiso.auto_id
    self.user_id = permiso.solicitante_id
    if permiso.fecha
      self.tipo_permiso = "Permiso diario"
    else
      self.tipo_permiso = "Permiso de no pernocta"
    end
    self.save
  end
end
