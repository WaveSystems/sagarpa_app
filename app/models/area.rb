class Area < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'jefe_id'
  has_many :vehiculos
  
  def self.get_areas
    @areas = self.all
    @areas.collect { |p| [p.nombre,  p.id] }
  end
end
