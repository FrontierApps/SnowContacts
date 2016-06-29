class Sign < ApplicationRecord
	belongs_to :contact
	belongs_to :location, optional: true
	has_many :jobnumbers
	has_many :sign_details
	scope :matchesContactandLocation, ->(id){ where(contact_id: id)}
end
