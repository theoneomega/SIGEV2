class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :ci
      t.string :first_name
      t.string :last_name
      t.string :last_name2
      t.string :alias
      t.date :birth_date
      t.string :originative
      t.string :genre
      t.boolean :record
      t.string :profession
      t.text :observations
      t.string :status_id
      t.string :registered_from
      t.text :searchable
      t.boolean :visible
      t.text :hide_reason

      t.timestamps
    end
  end
end
