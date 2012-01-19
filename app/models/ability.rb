class Ability
  include CanCan::Ability

  def initialize(user) 

    # Guest user
    user ||= User.new

    if user.tipo? :administrador
      can :manage, :all
    if user.tipo? :normal
      can :manage, :solicitantes
    else
      can :read, :home
    end
  end
end
