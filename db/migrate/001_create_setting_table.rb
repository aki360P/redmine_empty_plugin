class CreateSettingTable < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x,  class CreateSettingTable < ActiveRecord::Migration
  #for redmine 4x,  class CreateSettingTable < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :remp_settings do |t|
      t.column :project_id, :integer
      t.column :tracker_id, :integer
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :remp_settings
  end
end
