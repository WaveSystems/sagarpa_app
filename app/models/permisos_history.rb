class PermisosHistory < ActiveRecord::Base
  def self.register(permiso)
    log = self.new
    vehiculo = Vehiculo.get_vehiculo_permiso(permiso.auto_id)
    solicitante = User.get_solicitante(permiso.solicita_id)
    log.event = "Registrada la entrada de #{vehiculo} a las #{Time.now.hour}:#{Time.now.min} el #{Time.now.day}/#{Time.now.month}/#{Time.now.year}, permiso #{permiso.id}, por #{solicitante}"
    log.permiso_id = permiso.id
    log.auto_id = permiso.auto_id
    log.user_id = permiso.solicita_id
    if permiso.tipo == "Permiso Diario"
      log.tipo_permiso = permiso.tipo
    else
      log.tipo_permiso = "Permiso Pernocta"
    end
    log.save
  end
end
