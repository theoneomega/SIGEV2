class AddAnalystFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :analyst_number, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :last_name2, :string
    add_column :users, :area, :string
    add_column :users, :department_id, :integer
  end
end
