class AddCommentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_name, :text
  end
end
