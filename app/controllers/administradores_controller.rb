class AdministradoresController < ApplicationController
  before_filter :authenticate_user!
  def menu
    @Message = "Menu administrador"
  end
end
