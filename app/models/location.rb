class Location < ApplicationRecord
	
	belongs_to :contact
	has_many :people
	

	scope :matchesContact, ->(id){ where(contact_id: id)}
	

end
