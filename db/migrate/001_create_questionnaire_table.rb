class CreateQuestionnaireTable < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :rqre_questionnaires do |t|
      t.column :project_id, :integer
      t.column :title, :string
      t.column :note, :string
      t.column :description, :string
      t.column :revote, :boolean, default: true, null: false
      t.column :end, :datetime
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rqre_questionnaires
  end
end
