class SignsController < ApplicationController
	before_action :authenticate_user!
    layout 'contact'
	def index
		@contact = Contact.find(params[:id])
		if params[:loc]== "main"
		else
		@location = Location.find(params[:loc])
		end
	end
end
