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

  match 'solicitante/:id/change_password' => 'solicitantes#change_password', :as => :change_password
  match 'solicitante/:id/update_password' => 'solicitantes#update_password', :as => :update_password


  get 'administrador' => 'administradores#menu', :as => :menu_administrador
  match 'administrador/search_permiso' => 'administradores#search_permiso', :as => :search_permiso

  match 'administrador/show_permiso_pernocta' => 'administradores#show_permiso_pernocta', :as => :show_permiso_pernocta
  match 'administrador/:id/autorizar_permiso_pernocta' => 'administradores#autorizar_permiso_pernocta!', :as => :autorizar_permiso_pernocta
  match 'administrador/search_permiso_pernocta' => 'administradores#search_permiso_pernocta', :as => :search_permiso_pernocta

  match 'administrador/show_permiso_diario' => 'administradores#show_permiso_diario', :as => :show_permiso_diario
  match 'administrador/:id/autorizar_permiso_diario' => 'administradores#autorizar_permiso_diario!', :as => :autorizar_permiso_diario
  match 'administrador/search_permiso_diario' => 'administradores#search_permiso_diario', :as => :search_permiso_diario

  match 'administrador/reportes' => 'administradores#reportes', :as => :reportes

  match 'administrador/reportes/sort/pernocta' => 'administradores#sort_reporte_pernocta', :as => :sort_reporte_pernocta
  match 'administrador/reportes/sort/permiso_diario' => 'administradores#sort_reporte_permiso_diario', :as => :sort_reporte_permiso_diario

  match 'administrador/reportes/pernocta' => 'administradores#show_reporte_pernocta', :as => :show_reporte_pernocta
  match 'administrador/reportes/permiso_diario' => 'administradores#show_reporte_permiso_diario', :as => :show_reporte_permiso_diario

  get 'vigilante' => 'vigilantes#index', :as => :index_vigilante
end
