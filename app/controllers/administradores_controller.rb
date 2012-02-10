class AdministradoresController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!

  def menu
  end

  def search_permiso
  end

  def search_permiso_pernocta
  end

  def search_permiso_diario
  end

  def show_permiso_pernocta
    @permiso_pernocta = PermisoPernocta.find(params[:id])
  end

  def show_permiso_diario
    @permiso_diario = PermisoDiario.find(params[:id])
  end

  def autorizar_permiso_pernocta!
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    @permiso_pernocta.update_attributes(params[:permiso_pernocta])
    redirect_to "/administrador"
  end

  def autorizar_permiso_diario!
    @permiso_diario = PermisoDiario.find(params[:id])
    @permiso_diario.update_attributes(params[:permiso_diario].merge(:autorizo => current_user.nombre))
    redirect_to "/administrador"
  end

  def reportes
    if User.authorize_administrator(current_user.tipo)
      flash[:alert]="Area de reportes"
    else
      flash[:alert]="Usuario no administrador"
      redirect_to "/administrador"
    end
  end

  def sort_reporte_pernocta
  end

  def sort_reporte_permiso_diario
  end

  def show_reporte_pernocta
    @permiso_pernocta = PermisoPernocta.all
  end

  def show_reporte_permiso_diario
    @permiso_diario = PermisoDiario.all
  end

  # This helper method will allow us to authorize users if they have privileges to use this side of the application
  private
  def authorize_user!
    if current_user.tipo == "administrador" || current_user.tipo == "asistente"
      flash[:alert]="Bienvenido Administrador"
    else
      flash[:alert]="Usuario no administrador"
      redirect_to :root
    end
  end
end
