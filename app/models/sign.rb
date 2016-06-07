class Sign < ApplicationRecord
	belongs_to :contact
	belongs_to :location, optional: true
	has_many :jobnumbers
	scope :matchesContactandLocation, ->(id){ where(contact_id: id)}
end
