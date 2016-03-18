class LocationsController < ApplicationController
	 def new
      @location = Location.new
    end
  def index
      @contacts = Contact.all
        if params[:search]

            @contact = Contact.find(params[:search])
            @locations = Location.matchesContact(params[:search])
            respond_to do |format|
               format.html { render "show" }
               format.js { render "show" }
            end
        else

        end

  end

  def show
      @contact = Contact.find(params[:id])
      @location = Location.matchesContact(params[:id])
         
        respond_to do |format|
           format.html { render "show" }
           format.js { render "show" }
        end

  end
	
  def create
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.create(location_params)
    flash[:notice] = "Location was successfully created." if @location.save
    respond_with(@contact)
	end
 
  def destroy
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.find(params[:id])
    @location.destroy
    redirect_to contact_path(@contact)
  end
 
  private
    def location_params
      params.require(:location).permit(:locationName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone)
    end
end


