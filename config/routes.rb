Rails.application.routes.draw do
  #resources :projects do
  #  resources :remp_boards
  #  match 'settings/remp_setting/:action', :controller => 'remp_settings', :via => [:get, :post, :patch, :put]
  #end

  match 'projects/:project_id/remp_boards/:action', :controller => 'remp_boards', :via => [:get]
  match 'projects/:project_id/settings/remp_setting/:action', :controller => 'remp_settings', :via => [:get, :post, :patch, :put]
end