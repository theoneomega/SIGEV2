class Crime < ActiveRecord::Base
  attr_accessible :description, :id
  has_many :events
end
