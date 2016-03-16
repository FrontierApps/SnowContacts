class Person < ApplicationRecord
	belongs_to :contact
	belongs_to :location
	accepts_nested_attributes_for :contact


	scope :matchesLocation, ->(id){ where(location_id: id)}
end
