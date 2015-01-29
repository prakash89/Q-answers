class AddCategoryToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :category, :string
  end
end
