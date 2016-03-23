class Contact < ApplicationRecord
	has_many :locations
	has_many :contacts
		
  default_scope {order('CompanyName ASC')}
  
	def self.search(search)
	  where("id = ?", search) 
	  
	end
	

end
