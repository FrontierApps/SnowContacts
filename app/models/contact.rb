class Contact < ApplicationRecord
	has_many :locations, dependent: :destroy
	
  default_scope {order('CompanyName ASC')}
  
	def self.search(search)
	  where("id = ?", search) 
	  
	end
	

end
