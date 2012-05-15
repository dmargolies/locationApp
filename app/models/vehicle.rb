class Vehicle < ActiveRecord::Base
  attr_accessible :details, :name, :route
  
  validates :name, :presence=> true
  
  has_many :locations #all past and present location(s)
  belongs_to :location #just the current location
  
end
