class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :description
      t.integer :township_id

      t.timestamps
    end
  end
end
