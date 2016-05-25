class SignsController < ApplicationController

    layout 'contact'
	def index
		@contact = Contact.find(params[:id])

		if params[:loc]== "main"
		else
		@location = Location.find(params[:loc])
		end
	end
	def show
		
		@sign= Sign.where(contact_id: params[:id], location_id: params[:loc])
	end

	def new
        @sign = Sign.new
    end
    def create
    	 
    	 @sign = Sign.new(sign_params)
    	 @contact = @sign.contact_id
         if @sign.save
      		redirect_to contact_path(:id => @sign.contact_id), status: 303, format: 'js'
       
     	 end
	end
end
private
    def sign_params
      params.require(:sign).permit(:signDesc, :signLoc, :active, :builtBy, :installDate, :contact_id, :location_id)
    end
