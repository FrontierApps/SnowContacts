class LocationsController < ApplicationController
	
	def create
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.create(location_params)
    redirect_to company_path(@contact)
	end
 
  def destroy
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.find(params[:id])
    @location.destroy
    redirect_to contact_path(@contact)
  end
 
  private
    def location_params
      params.require(:location).permit(:address, :address1, :city, :state, :zip, :phone)
    end
end


