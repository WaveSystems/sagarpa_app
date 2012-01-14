class Vehiculo < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'responsable_id'
  belongs_to :area, :foreign_key => 'area_id'

end
