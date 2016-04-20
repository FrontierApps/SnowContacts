class Contact < ApplicationRecord
	has_many :locations
	has_many :people
	has_many :signs
		
  default_scope {order('CompanyName ASC')}
  
		

end
