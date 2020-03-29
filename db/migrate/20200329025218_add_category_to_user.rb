class AddCategoryToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :category, :integer
  end
end
