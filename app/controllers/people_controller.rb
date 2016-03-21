class PeopleController < ApplicationController
	def new
    @person = Person.new
  end
  def edit
    @person = Person.find(params[:id])
  end	
  def create
    @location = Location.find(params[:location_id])
    @person = @location.people.create(people_params)
    flash[:notice] = "Person was successfully created." if @person.save
    respond_with(@location)
	end
  def destroy
    @location = Location.find(params[:location_id])
    @person = @location.people.find(params[:id])
    @person.destroy
    redirect_to location_path(@location)
  end
  private
    def location_params
      params.require(:person).permit(:FirstName, :LastName, :Title, :MobilePhone, :EmailName)
    end
end
