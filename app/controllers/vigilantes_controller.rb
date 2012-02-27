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
