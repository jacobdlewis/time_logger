class AddIndexToClientSlug < ActiveRecord::Migration
  def change
    change_table :clients do |u|
      u.index :slug, :unique => true
    end
  end
end
