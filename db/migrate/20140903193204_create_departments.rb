class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :description

      t.timestamps
    end
  end
end
