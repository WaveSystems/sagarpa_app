class PermisoDiario < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'solicita_id'
  belongs_to :vehiculo, :foreign_key => 'auto_id'
  before_save :default_values

  validates_presence_of :auto_id, :justificacion, :observaciones, :fecha, :hora_salida, :hora_llegada, :solicita_id, :jefe_id

  # Check and add the default values
  def default_values
    if self.estado == nil
      self.estado = 'No autorizado'
    elsif self.estado == 'Rechazado'
      self.estado = 'Rechazado'
    elsif self.estado == 'Finalizado'
      self.estado = 'Finalizado'
    else
      self.estado = 'Autorizado'
    end
  end

  # The same behavior of permiso pernocta model
  def self.next_id
    if PermisoDiario.last.nil?
      return 1
    else
      return PermisoDiario.last.id+1
    end
  end

  # Get all the permisos of each user
  def self.get_user_permiso_diario(id)
    return PermisoDiario.where("solicita_id = '#{id}'").order("id desc")
  end
end
