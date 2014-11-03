class Department < ActiveRecord::Base
  attr_accessible :description
  has_many :users
end
