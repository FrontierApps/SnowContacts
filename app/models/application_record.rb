class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true
  $contacts = Contact.all
  d=Date.today
  $beginning_of_this_week = d.at_beginning_of_week-1.day
  $end_of_this_week = d.at_beginning_of_week+6.day

end
