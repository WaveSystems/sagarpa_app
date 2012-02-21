class Vehiculo < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'responsable_id'
  belongs_to :area, :foreign_key => 'area_id'
  before_save :set_available

  # Get the area vehicles
  def self.get_area_vehiculos(id)
    return Vehiculo.where("area_id = '#{Area.find(User.find(id).area_id).id}' and estado = 'Disponible'")
  end

  def set_available
    self.estado = "Disponible" unless self.estado == "Ocupado"
  end

end
