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
    @vehiculo = Vehiculo.find(@permiso_pernocta.auto_id)

    if @vehiculo.estado == "Disponible" && @permiso_pernocta.estado = "No autorizado"
      @vehiculo.estado = "Ocupado"
      @vehiculo.save
      @permiso_pernocta.estado = "Autorizado"
      @permiso_pernocta.save
    else
      flash[:alert]="Automovil no disponible"
    end

    redirect_to "/administrador"
  end

  def autorizar_permiso_diario!
    @permiso_diario = PermisoDiario.find(params[:id])
    @vehiculo = Vehiculo.find(@permiso_diario.auto_id)

    if @vehiculo.estado == "Disponible" && @permiso_diario.estado = "No autorizado"
      @vehiculo.estado = "Ocupado"
      @vehiculo.save
      @permiso_diario.autorizo = current_user.nombre
      @permiso_diario.save
    else
      flash[:alert]="Automovil no disponible"
    end

    redirect_to "/administrador"
  end

  def rechazar_permiso_pernocta!
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    @permiso_pernocta.estado = "Rechazado"
    @permiso_pernocta.save
    redirect_to "/administrador"
  end

  def rechazar_permiso_diario!
    @permiso_diario = PermisoDiario.find(params[:id])
    @permiso_diario.estado = "Rechazado"
    @permiso_diario.autorizo = current_user.nombre
    @permiso_diario.save
    redirect_to "/administrador"
  end

  # This helper method will allow us to authorize users if they have privileges to use this side of the application
  private
  def authorize_user!
    unless current_user.tipo == "administrador" || current_user.tipo == "asistente"
      flash[:alert]="Usuario no administrador"
      redirect_to :root
    end
  end
end
