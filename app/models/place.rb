class Place < ActiveRecord::Base
  attr_accessible :description
  has_many :events
end
