class Contact < ApplicationRecord
	has_many :people
	has_many :locations, through: :people
	
  default_scope {order('CompanyName ASC')}
  
	def self.search(search)
	  where("id = ?", search) 
	  
	end
	

end
