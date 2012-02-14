class Area < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'jefe_id'
  has_many :vehiculos
end
