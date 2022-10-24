class RempSetting < ActiveRecord::Base
  include Redmine::SafeAttributes
  belongs_to :project

  validates_uniqueness_of :project_id
  validates :project_id, presence: true
  

  def self.find_or_create(project_id)
    remp_setting = RempSetting.where(['project_id = ?', project_id]).first
    puts ' ====================== '
    
    unless remp_setting.present?
      remp_setting = RempSetting.new()
      remp_setting.attributes = { project_id: project_id }
      
      # Set default
      remp_setting.attributes = { tracker_id: 1 }
            
      remp_setting.save!
    end
    remp_setting
  end

end
