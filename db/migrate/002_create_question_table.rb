class CreateQuestionTable < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :rqre_questions do |t|
      t.column :questionnaire_id, :integer
      t.column :title, :string
      t.column :dtype, :integer
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rqre_questions
  end
end
