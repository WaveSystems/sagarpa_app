class SolicitantesController < ApplicationController
  before_filter :authenticate_user!
  def menu
  end
  def new
    @permiso_pernocta = PermisoPernocta.new
    @id = PermisoPernocta.last.id+1
  end
  def create
    PermisoPernocta.create(params[:permiso_pernocta])
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
  end
end
