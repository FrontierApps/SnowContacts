class Person < ApplicationRecord
	belongs_to :location
	
	scope :matchesLocation, ->(id){ where(location_id: id)}
end
