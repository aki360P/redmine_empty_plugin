class RqreQuestionsController < ApplicationController
  unloadable
  before_action :require_login
  before_action :find_user, :find_project
  #before_action :authorize

  def edit   
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
  
  #def rqre_setting_params
  #  params.require(:settings).permit('project_id','tracker_id')
  #end
end
