class AddSlugColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :slug, :string
  end
end
