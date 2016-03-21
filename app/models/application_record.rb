class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true
  $contacts = Contact.all
end
