class Event < ActiveRecord::Base
  attr_accessible :address, :area, :crime_id, :description, :event_date, :latitude, :locality_id
  attr_accessible :longitude, :observations, :place_id, :priority, :reason_hide, :source, :status_id
  attr_accessible :suburb, :township_id, :tramo_carretero, :user_id, :visible
  belongs_to :status
  belongs_to :crime
  belongs_to :user
  belongs_to :township
  belongs_to :locality
  belongs_to :place
  has_many :person

  acts_as_gmappable :process_geocoding => false
  def gmaps4rails_infowindow
    "<h5>Delito:\n\ #{self.crime.description}</h5>"  << "<i>#{self.description}</i>"
  end



end
