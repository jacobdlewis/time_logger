class AddCategoryIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category_id, :integer
    add_foreign_key :projects, :categories
  end
end
