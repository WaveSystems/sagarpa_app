class VigilantesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user! 
  def index
  end

  def tables
    @vehiculo_ocupado = Vehiculo.where("estado = 'Ocupado'")
  end

  def finish
    @vehiculo = Vehiculo.find(params[:id])
    @permiso_diario = PermisoDiario.find_by_auto_id(@vehiculo.id)
    @permiso_pernocta = PermisoPernocta.find_by_auto_id(@vehiculo.id)
    if @permiso_pernocta == nil
      PermisosHistory.register(@permiso_diario)
    else
      PermisosHistory.register(@permiso_pernocta)
    end
    @vehiculo.estado = "Disponible"
    @vehiculo.save
    redirect_to "/vigilante"
  end

  private
  def authorize_user!
    unless current_user.tipo == "vigilante" 
      flash[:alert]="Usuario no vigilante"
      redirect_to :root
    end
  end
end
