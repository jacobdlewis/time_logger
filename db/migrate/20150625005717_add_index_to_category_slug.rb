class AddIndexToCategorySlug < ActiveRecord::Migration
  def change
    change_table :categories do |u|
      u.index :slug, :unique => true
    end
  end
end
