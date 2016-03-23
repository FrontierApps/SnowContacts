class Person < ApplicationRecord
	belongs_to :contact
	
	scope :matchesLocation, ->(id){ where(location_id: id)}
end
