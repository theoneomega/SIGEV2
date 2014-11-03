class Township < ActiveRecord::Base
  attr_accessible :description
  has_many :localities
  has_many :events
end
