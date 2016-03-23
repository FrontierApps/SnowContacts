class Location < ApplicationRecord
	
	belongs_to :contact
	

	scope :matchesContact, ->(id){ where(contact_id: id)}
	

end
