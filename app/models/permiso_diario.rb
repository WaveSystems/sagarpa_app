class PermisoDiario < ActiveRecord::Base
  
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
    return PermisoDiario.where("solicita_id = '#{id}'")
  end
end
