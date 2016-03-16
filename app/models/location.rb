class Location < ApplicationRecord
	has_many :people
	has_many :contacts, through: :people

	scope :matchesContact, ->(id){ where(contact_id: id)}

end
