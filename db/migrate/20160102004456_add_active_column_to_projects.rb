class AddActiveColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :active, :boolean, default: true
  end
end
