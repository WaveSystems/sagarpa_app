class SolicitantesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!

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

  # ======== Generic section =============================================== 
  # Render permso diario from javascript ajax request
  def show_permiso_diario
    @permiso_diario = PermisoDiario.get_user_permiso_diario(current_user.id).page(params[:page]).per(7)
    @solicita = current_user.nombre
  end

  def show_permiso_pernocta
    @permiso_pernocta = PermisoPernocta.get_user_permiso_pernocta(current_user.id).page(params[:page]).per(7)
  end

  def show_pdf
    @permiso_pernocta = PermisoPernocta.find(params[:id])
    @solicita = current_user.nombre
    @VoBo = User.get_jefe_area(current_user.id)
    @vehiculo = Vehiculo.find(@permiso_pernocta.auto_id)
  end

  def show_pdf_diario
    @permiso_diario = PermisoDiario.find(params[:id])
    @solicita = current_user.nombre
    @VoBo = User.get_jefe_area(current_user.id)
    @vehiculo = Vehiculo.find(@permiso_diario.auto_id)
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
  ## ================== Passwords stuff =======================================
  def change_password
    @user = User.find(params[:id])
  end

  def update_password
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    flash[:alert]="Cambios guardados exitosamente"
    redirect_to "/solicitante"
  end

  private
  def authorize_user!
    unless current_user.autorizado == "Si"
      flash[:alert]="Usuario no Autorizado"
      redirect_to :root
    end
  end
end
