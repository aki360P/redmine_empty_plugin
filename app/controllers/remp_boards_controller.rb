class RempBoardsController < ApplicationController
  unloadable
  before_action :find_user, :find_project
  before_action :load_config
  before_action :authorize


  def initialize
    super()
  end

  def index
    # find issues
    @remp_issues = Issue.where("tracker_id = ?", @remp_setting.tracker_id)

    # eliminate unauthorized issues
    @remp_gb1 = Setting.plugin_redmine_empty_plugin['remp_gb1']

    if not @remp_gb1 == 'true'
      @remp_issues = @remp_issues.where("project_id = ?", @project.id)
    end

  end
  
  def show
  end

  def edit
  end
  
  def update
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
  
  
  def load_config
    @remp_setting = RempSetting.find_by(project_id: @project.id)
  end


end
