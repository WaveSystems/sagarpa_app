class PermisoPernocta < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'solicita_id'
  before_save :default_values
  validates_presence_of :auto_id, :justificacion, :observaciones, :fecha_hora_salida, :fecha_hora_llegada, :domicilio_pernocta, :num_oficio, :solicita_id, :VoBo_id

  # Default values for the aplication
  def default_values
    self.tramito = 'Lic. Hector Hernandez Rolon' unless self.tramito
    self.autorizo = 'Dr. Salvador Becerra Rodriguez' unless self.autorizo
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
    return PermisoPernocta.where("solicita_id = '#{id}'")
  end
end
