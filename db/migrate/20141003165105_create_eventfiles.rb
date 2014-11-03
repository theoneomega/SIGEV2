class CreateEventfiles < ActiveRecord::Migration
  def change
    create_table :eventfiles do |t|
      t.string :upload
      t.integer :event_id
      t.string :uploader
      t.boolean :visible
      t.text :hide_reason

      t.timestamps
    end
  end
end
