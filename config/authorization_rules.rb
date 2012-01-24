authorization do
  role :adminitrador do
    has_permission_on [:administradores, :solicitantes], :to => [:menu, :new, :create, :show_history, :show_pdf]
  end
end
