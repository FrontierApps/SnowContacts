class Contact < ApplicationRecord
	has_many :locations
	has_many :people
	has_many :signs
	has_many :jobnumbers
	has_many :timerecords, through: :jobnumbers
		
  default_scope {order('CompanyName ASC')}
  
		

end
