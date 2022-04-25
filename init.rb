require File.expand_path('../lib/remp_projects_helper_patch', __FILE__)

Redmine::Plugin.register :redmine_empty_plugin do
  name 'Redmine empty plugin'
  author 'Akinori Iwasaki'
  description 'Sample plugin for beginner developers'
  version '0.3.0'
  url 'https://github.com/aki360P/redmine_empty_plugin'
  
  project_module :redmine_empty_plugin do
    permission :remp_board_view, :remp_boards => [:index, :show]
    permission :remp_board_edit, :remp_boards => [:edit, :update]
    permission :remp_setting, :remp_settings => [:edit]
  end
  
  
  # add tab - project module
  menu :project_menu, :remp_boards, {:controller => 'remp_boards', :action => 'index' }, :caption => :label_remp, :param => :project_id
  
  
  # setting
  settings  partial: 'remp_global_settings/show',
            default: {
              'remp_gb1' => 'false'
               }
end