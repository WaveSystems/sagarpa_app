class PermisoPernocta < ActiveRecord::Base
  before_save :default_values
  validates_presence_of :auto_id, :justificacion, :observaciones, :fecha_hora_salida, :fecha_hora_llegada, :domicilio_pernocta, :num_oficio, :solicita_id, :VoBo_id

  # Default values for the aplication
  def default_values
    self.tramito = 'Lic. Hector Hernandez Rolon' unless self.tramito
    self.autorizo = 'Dr. Salvador Becerra Rodriguez' unless self.autorizo
  end
end
