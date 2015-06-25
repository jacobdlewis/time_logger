class AddIndexUniquenessToSlugColumnOnUsers < ActiveRecord::Migration
  def change
    change_table :users do |u|
      u.index :slug, :unique => true
    end
  end
end
