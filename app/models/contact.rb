class Contact < ApplicationRecord
	has_many :locations
	has_many :people
		
  default_scope {order('CompanyName ASC')}
  
		

end
