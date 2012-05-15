class Location < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :details, :latitude, :longitude
end
