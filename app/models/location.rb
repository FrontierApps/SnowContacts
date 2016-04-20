class Location < ApplicationRecord
	belongs_to :contact
	has_many :signs

	scope :matchesContact, ->(id){ where(contact_id: id)}
	

end
