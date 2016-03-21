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
  end
  def edit
    @location = Location.find(params[:id])
  end	

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location, format: 'js'
      
    else 

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
end

 
  private
    def location_params
      params.require(:location).permit(:locationName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone)
    end



