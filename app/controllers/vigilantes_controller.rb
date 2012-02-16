class VigilantesController < ApplicationController
  def index
    @vehiculo_ocupado = Vehiculo.where("estado = 'Ocupado'")
    @vehiculo_disponible = Vehiculo.where("estado = 'Disponible'")
  end

  def finish
    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.estado = "Disponible"
    @vehiculo.save
    redirect_to "/vigilante"
  end
end
