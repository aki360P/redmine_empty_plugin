Rails.application.routes.draw do
  #add /projects/:id
  resources :projects do
    #add get /projects/:id/rqre_boards using controller 'rqre_boards' action 'index' 
    resources :rqre_questionnaires

    #add patch /projects/:id/settings/rqre_setting using controller 'rqre_settings' action 'edit'
    #patch :rqre_setting, path: '/settings/rqre_setting', controller: 'rqre_settings', action: :edit
  end

  #old Using a dynamic :action segment in a route is deprecated and will be removed in Rails 6.0.
  #match 'projects/:project_id/rqre_boards/:action', :controller => 'rqre_boards', :via => [:get]
  #match 'projects/:project_id/settings/rqre_setting/:action', :controller => 'rqre_settings', :via => [:get, :post, :patch, :put]
end