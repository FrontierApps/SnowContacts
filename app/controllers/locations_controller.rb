class LocationsController < ApplicationController
  
  def index
    
    if params[:id]
      @contact = Contact.find(params[:id])
      @locations = Location.matchesContact(params[:id])
      @location = Location.new
        respond_to do |format|
          format.html { render "show" }
          format.js { render "show" }
        end
     
    else
    end
  end
  def show
    
    @locations = Location.matchesContact(params[:id])
    @contact = Contact.find(params[:id])
    @location = Location.new
      respond_to do |format|
        format.html { render "show" }
        format.js { render "show" }
      end
  end
  def new
    @location = Location.new
    @contact = Contact.find(params[:contact_id])
  end
  def edit
    @location = Location.find(params[:id])
    @contact = Contact.find(params[:contact_id])
  end	

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to contact_path(params[:contact_id]), format: 'js'
      
    else 

    end
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.create(location_params)
    flash[:notice] = "Location was successfully created." 
     if @location.save
      redirect_to contact_path(params[:contact_id]), status: 303, format: 'js'
       
     end
	end
  def destroy
    @contact = Contact.find(params[:contact_id])
    @location = @contact.locations.find(params[:id])
    @location.destroy
      redirect_to contact_path(params[:contact_id]), status: 303, format: 'js'
       
  end
end
 
  private
    def location_params
      params.require(:location).permit(:locationName, :onsiteContactName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone, :FaxNumber, :notes)
    end



