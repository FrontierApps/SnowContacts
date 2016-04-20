class Sign < ApplicationRecord
	belongs_to :contact
	belongs_to :location, optional: true
end
