class PermisoDiario < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'solicita_id'
  belongs_to :vehiculo, :foreign_key => 'auto_id'
  before_save :default_values

  validates_presence_of :auto_id, :justificacion, :observaciones, :fecha, :hora_salida, :hora_llegada, :solicita_id, :jefe_id

  MONTHS = {
    "1" => "Enero",
    "2" => "Febrero",
    "3" => "Marzo",
    "4" => "Abril",
    "5" => "Mayo",
    "6" => "Junio",
    "7" => "Julio",
    "8" => "Agosto",
    "9" => "Septiembre",
    "10" => "Octubre",
    "11" => "Noviembre",
    "12" => "Diciembre"
  }

  # Check and add the default values
  def default_values
    self.tipo = 'Permiso Diario'
    if self.estado == nil
      self.estado = 'No autorizado'
    elsif self.estado == 'Rechazado'
      self.estado = 'Rechazado'
    else
      self.estado = 'Autorizado'
    end
  end

  def self.finish_permiso
    self.estado = "Finalizado"
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
