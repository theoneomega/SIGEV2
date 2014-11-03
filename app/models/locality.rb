class Locality < ActiveRecord::Base
  attr_accessible :description, :township_id
  belongs_to :township
  has_many :events
end
