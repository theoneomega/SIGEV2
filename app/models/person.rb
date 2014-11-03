class Person < ActiveRecord::Base
  attr_accessible :alias, :birth_date, :ci, :first_name, :genre, :hide_reason, :last_name, :last_name2, :observations, :originative, :profession, :record, :registered_from, :searchable, :status_id, :visible
  has_many :vehicles
  belongs_to :event
  belongs_to :status
end
