class Location < ApplicationRecord
	has_many :people
	has_many :contacts, through: :people
	accepts_nested_attributes_for :people

	scope :matchesContact, ->(id){ where(contact_id: id)}

end
