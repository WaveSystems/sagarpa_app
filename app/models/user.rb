class User < ActiveRecord::Base
  has_many :areas
  has_many :permiso_diarios
  has_many :permiso_pernoctas
  has_many :vehiculos

  TIPOS = %w[normal avanzado administrador]
  AUTORIZADO = %w[Si No]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nombre, :area_id, :autorizado, :tipo

  # Get the current user name
  def self.get_solicitante(id)
    return User.find(id).nombre
  end
  # Get the current user jefe of his area
  def self.get_jefe_area(id)
    return User.find(Area.find(User.find(id).area_id).jefe_id).nombre
  end
  # Get the current boss id
  def self.get_jefe_id(id)
    return User.find(Area.find(User.find(id).area_id).jefe_id).id
  end

  #Get the authorization for middle level users
  def self.authorize_administrator(type)
    if type == "administrador"
      true
    else
      false
    end
  end
end
