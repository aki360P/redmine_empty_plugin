Rails.application.routes.draw do
  #add /projects/:id
  resources :projects do
    #add get /projects/:id/remp_boards using controller 'remp_boards' action 'index' 
    resources :remp_boards, only: [:index]

    #add patch /projects/:id/settings/remp_setting using controller 'remp_settings' action 'edit'
    patch :remp_setting, path: '/settings/remp_setting', controller: 'remp_settings', action: :edit
  end

  #old Using a dynamic :action segment in a route is deprecated and will be removed in Rails 6.0.
  #match 'projects/:project_id/remp_boards/:action', :controller => 'remp_boards', :via => [:get]
  #match 'projects/:project_id/settings/remp_setting/:action', :controller => 'remp_settings', :via => [:get, :post, :patch, :put]
end