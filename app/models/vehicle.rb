class Vehicle < ActiveRecord::Base
  attr_accessible :brand, :color, :line, :model, :person_id, :plate, :registered_from, :serial_number, :status, :stolen
  belongs_to :person
end
