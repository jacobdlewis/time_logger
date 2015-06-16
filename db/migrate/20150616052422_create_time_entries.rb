class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.datetime    :date
      t.string      :client_id
      t.string      :category_id
      t.string      :comment
      t.string      :area
      t.integer     :business_mileage
      t.integer     :personal_mileage
      t.integer     :hours_worked
      t.timestamps  null: false
    end
  end
end