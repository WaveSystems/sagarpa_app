class PermisoPernocta < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'solicita_id'
  belongs_to :vehiculo, :foreign_key => 'auto_id'
  before_save :default_values
  before_save :status_pernocta
  validates_presence_of :auto_id, :justificacion, :observaciones, :fecha_hora_salida, :fecha_hora_llegada, :domicilio_pernocta, :num_oficio, :solicita_id, :VoBo_id

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


  # Default values for the aplication
  def default_values
    self.tramito = 'Lic. Hector Hernandez Rolon' unless self.tramito
    self.autorizo = 'Dr. Salvador Becerra Rodriguez' unless self.autorizo
    self.tipo = 'Permiso Pernocta'
  end
  
  def status_pernocta
    if self.estado == nil
      self.estado = 'No autorizado'
    elsif self.estado == 'Rechazado'
      self.estado = 'Rechazado'
    else
      self.estado = 'Autorizado'
    end
  end

  # Get the last ID plus one from database
  def self.next_id
    if PermisoPernocta.last.nil?
      return 1
    else
      return PermisoPernocta.last.id+1
    end
  end
  # Get all the permisos of each user
  def self.get_user_permiso_pernocta(id)
    return PermisoPernocta.where("solicita_id = '#{id}'").order("id desc")
  end

  def self.finish_permiso
    self.estado = "Finalizado"
  end
end
