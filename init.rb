#require File.expand_path('../lib/rqre_projects_helper_patch', __FILE__)

Redmine::Plugin.register :redmine_questionnaire_plugin do
  name 'Redmine questionnaire plugin'
  author 'Akinori Iwasaki'
  description 'Add questionnaire function'
  version '0.1.0'
  url 'https://github.com/aki360P/redmine_questionnaire_plugin'
  
  project_module :redmine_questionnaire_plugin do
    permission :rqre_questionnaires_view, :rqre_questionnaires => [:index, :show]
    permission :rqre_questionnaires_edit, :rqre_questionnaires => [:edit, :update, :new, :create]
  end
  
  
  # add tab - project module
  menu :project_menu, :rqre_questionnaires, {:controller => 'rqre_questionnaires', :action => 'index' }, :caption => :label_rqre, :param => :project_id
  
  
  # setting
  settings  partial: 'rqre_global_settings/show',
            default: {
              'rqre_gb1' => 'false'
               }
end