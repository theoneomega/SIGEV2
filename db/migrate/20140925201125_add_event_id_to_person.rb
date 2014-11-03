class AddEventIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :event_id, :integer
  end
end
