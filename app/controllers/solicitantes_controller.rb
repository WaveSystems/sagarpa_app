class SolicitantesController < ApplicationController
  before_filter :authenticate_user!
  def menu
  end
  def new
    @permiso = Permiso.new
  end
  def create
  end
  def show_history
  end
end
