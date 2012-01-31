class AdministradoresController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!

  def menu
  end

  def search_permiso
  end

  def show_permiso_pernocta
    @permiso_pernocta = PermisoPernocta.find(params[:id])
  end
  def show_permiso_diario
  end

  def autorizar_permiso_pernocta!
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    @permiso_pernocta.update_attributes(params[:permiso_pernocta])
    redirect_to "/administrador"
  end
 
  # This helper method will allow us to authorize users if they have privileges to use this side of the application
  private

  def authorize_user!
    if current_user.tipo == "administrador"
      flash[:alert]="Bienvenido Administrador"
    else
      flash[:alert]="Usuario no administrador"
      redirect_to :root
    end
  end
end
