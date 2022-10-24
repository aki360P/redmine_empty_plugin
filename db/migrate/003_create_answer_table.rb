class CreateVoteTable < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :rqre_votes do |t|
      t.column :question_id, :integer
      t.column :user_id, :integer
      t.column :answer, :string
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rqre_votes
  end
end
