class AddGmapableToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gmaps, :boolean
  end
end
