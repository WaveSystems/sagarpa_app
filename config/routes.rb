SagarpaApp::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'
  match 'acerca_de' => 'home#about', :as => :about_home
  match 'contacto' => 'home#contact', :as => :contact_home

  get 'solicitante' => 'solicitantes#menu', :as => :menu_solicitante                                                                             

  match 'solicitante/new_permiso_pernocta' => 'solicitantes#new', :as => :new_pemiso
  match 'solicitante/create' => 'solicitantes#create'

  match 'solicitante/new_permiso_diario' => 'solicitantes#new_permiso_diario', :as => :new_pemiso_diario
  match 'solicitante/create_permiso_diario' => 'solicitantes#create_permiso_diario'

  match 'solicitante/show_permiso_diario' => 'solicitantes#show_permiso_diario'
  match 'solicitante/show_permiso_pernocta' => 'solicitantes#show_permiso_pernocta'

  match 'solicitante/history' => 'solicitantes#show_history', :as => :history_permiso
  match 'solicitante/:id/imprimir' => 'solicitantes#show_pdf', :as => :show_pdf

  match 'solicitante/:id/imprimir_permiso_diario' => 'solicitantes#show_pdf_permiso_diario', :as => :show_pdf_permiso_diario


  get 'administrador' => 'administradores#menu', :as => :menu_administrador
  match 'administrador/search_permiso' => 'administradores#search_permiso', :as => :search_permiso
  match 'administrador/show_permiso_pernocta' => 'administradores#show_permiso_pernocta', :as => :show_permiso_pernocta
  match 'administrador/:id/autorizar_permiso_pernocta' => 'administradores#autorizar_permiso_pernocta!', :as => :autorizar_permiso_pernocta

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
