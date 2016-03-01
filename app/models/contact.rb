class Contact < ApplicationRecord
	has_many :locations, dependent: :destroy
	validates :Contact, presence: true,
						:uniqueness => true
  default_scope {order('CompanyName ASC')}
  
	def self.search(search)
	  where("CompanyName LIKE ?", "%#{search}%") 
	  
	end
	

end
