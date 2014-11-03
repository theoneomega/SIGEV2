class Status < ActiveRecord::Base
  attr_accessible :description, :status_type, :id
  has_many :events
  has_many :person, :dependent => :destroy
end
