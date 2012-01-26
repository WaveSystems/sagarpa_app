class SolicitantesController < ApplicationController
  before_filter :authenticate_user!

  def menu
  end
  ## ========= Permiso de pernocta section ============================ 
  def new
    @permiso_pernocta = PermisoPernocta.new
    @id = PermisoPernocta.next_id
    @solicita = User.get_solicitante(current_user.id)
    @VoBo = User.get_jefe_area(current_user.id)
    @vehiculos = Vehiculo.get_area_vehiculos(current_user.id)
  end

  def create
    PermisoPernocta.create(params[:permiso_pernocta].merge(:solicita_id => current_user.id, :VoBo_id => User.get_jefe_id(current_user.id)))
    redirect_to menu_solicitante_path
  end

  #def search
  #end
  # Defining show whose will be called by ajax
  #def show
  #  @permiso_pernocta = PermisoPernocta.find(params[:id])
  #end
  #def edit
  #  @permiso_pernocta = PermisoPernocta.find(params[:id])
  #  @id = PermisoPernocta.find(params[:id]).id
  #end
  #def update
  #  PermisoPernocta.find(params[:id]).update_attributes(params[:permiso_pernocta])
  #  redirect_to menu_solicitante_path
  #end

  def show_history
    @permiso_pernocta = PermisoPernocta.get_user_permiso_pernocta(current_user.id)
  end

  def show_pdf
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    #@permiso_diario = PermisoDiario.find(params[:id])
    @solicita = User.find(@permiso_pernocta.solicita_id).nombre
    @VoBo = User.find(@permiso_pernocta.VoBo_id).nombre
    @vehiculo = Vehiculo.find(@permiso_pernocta.auto_id)
    respond_to do |format|
      format.pdf do
        render :pdf => "Permiso_Pernocta#{:id}.pdf"
      end
    end
  end

  ## ================== Permiso diario section =================================
  def new_permiso_diario
    @permiso_diario = PermisoDiario.new
    @id = PermisoDiario.next_id
    @solicita = User.get_solicitante(current_user.id)
    @jefe_area = User.get_jefe_area(current_user.id)
    @vehiculos = Vehiculo.get_area_vehiculos(current_user.id)
  end

  def create_permiso_diario
    PermisoDiario.create(params[:permiso_diario].merge(:solicita_id => current_user.id, :jefe_id => User.get_jefe_id(current_user.id)))
    redirect_to menu_solicitante_path
  end
end
