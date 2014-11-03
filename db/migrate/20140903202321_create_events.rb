class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :priority
      t.date :event_date
      t.text :description
      t.string :address
      t.string :suburb
      t.text :observations
      t.string :source
      t.string :area
      t.integer :crime_id
      t.integer :township_id
      t.integer :locality_id
      t.integer :place_id
      t.integer :user_id
      t.integer :status_id
      t.float :longitude
      t.float :latitude
      t.string :tramo_carretero
      t.boolean :visible
      t.text :reason_hide

      t.timestamps
    end
  end
end
