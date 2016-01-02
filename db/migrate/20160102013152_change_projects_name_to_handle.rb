class ChangeProjectsNameToHandle < ActiveRecord::Migration
  def change
    rename_column :projects, :name, :handle
  end
end
