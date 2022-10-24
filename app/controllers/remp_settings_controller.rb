class RempSettingsController < ApplicationController
  unloadable
  before_action :require_login
  before_action :find_user, :find_project, :authorize

  def initialize
    super()
  end

  
  def edit
    unless params[:settings].nil?
      remp_setting = RempSetting.find_or_create(@project.id)
      
      remp_setting.update(remp_setting_params)
      remp_setting.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to controller: 'projects',
                  action: 'settings', id: @project, tab: 'remp_settings'
    end
    
  end
  
  def show
    
  end
  
  

  private

  def find_user
    @user = User.current
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
  
  def remp_setting_params
    params.require(:settings).permit('project_id','tracker_id')
  end
end
