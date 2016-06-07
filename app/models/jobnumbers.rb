class Jobnumbers < ActiveRecord::Base
	belongs_to :contact
	belongs_to :sign
	has_many :timerecords
	end
