class AddAnswerIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :answer_id, :integer
  end
end
