class SolicitantesController < ApplicationController
  before_filter :authenticate_user!
  def menu
  end
  def new
    @permiso_pernocta = PermisoPernocta.new
    @id = PermisoPernocta.last.id+1
    @solicita = User.find(current_user).nombre
    @VoBo = User.find(Area.find(User.find(current_user).area_id).jefe_id).nombre
    @vehiculos = Vehiculo.where("area_id = '#{Area.find(User.find(current_user).area_id).id}'")
  end

  def create
    PermisoPernocta.create(params[:permiso_pernocta].merge(:solicita_id => current_user.id, :VoBo_id => User.find(Area.find(User.find(current_user).area_id).jefe_id).id))
    redirect_to menu_solicitante_path
  end
  def search
  end
  # Defining show whose will be called by ajax
  def show
    @permiso_pernocta = PermisoPernocta.find(params[:id])
  end
  def edit
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    @id = PermisoPernocta.find(params[:id]).id
  end
  def update
    PermisoPernocta.find(params[:id]).update_attributes(params[:permiso_pernocta])
    redirect_to menu_solicitante_path
  end
  def show_history
    @user = current_user.id
    @permiso_pernocta = PermisoPernocta.where("solicita_id = '#{@user}'") 
  end
end
