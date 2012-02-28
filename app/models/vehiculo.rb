class Vehiculo < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'responsable_id'
  belongs_to :area, :foreign_key => 'area_id'
  has_many :permiso_pernoctas
  has_many :permiso_diarios
  before_save :set_available

  # Get the area vehicles
  def self.get_area_vehiculos(id)
    return Vehiculo.where("area_id = '#{Area.find(User.find(id).area_id).id}' and estado = 'Disponible'")
  end

  def set_available
    self.estado = "Disponible" unless self.estado == "Ocupado"
  end

  def self.get_vehiculo_permiso(id)
    vehiculo = self.find(id)
    return "#{vehiculo.brand} #{vehiculo.tipo} #{vehiculo.year}"
  end

  def self.get_vehiculo_actual(id)
    return self.find(id).tipo
  end

  def self.get_vehiculos
    vehiculo = Vehiculo.all
    vehiculo.collect { |p| [ p.placa_actual, p.id ] }
  end
end
