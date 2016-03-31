class PeopleController < ApplicationController
 
  def index
    
    if params[:id]
      @contact = Contact.find(params[:id])
      @people = Person.matchesContact(params[:id])
      @person = Person.new
        respond_to do |format|
          format.html { render "show" }
          format.js { render "show" }
        end
     
    else
    end
  end
  def show
    
    @people = Person.matchesContact(params[:id])
    @contact = Contact.find(params[:id])
    @person = Person.new
      respond_to do |format|
        format.html { render "show" }
        format.js { render "show" }
      end
  end
  def new
    @person = Person.new
    @contact = Contact.find(params[:contact_id])
  end
  def edit
    @person = Person.find(params[:id])
    @contact = Contact.find(params[:contact_id])
  end 

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to contact_path(params[:contact_id]), format: 'js'
      
    else 

    end
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @person = @contact.people.create(person_params)
    flash[:notice] = "Person was successfully created." 
     if @person.save
      redirect_to contact_path(params[:contact_id]), status: 303, format: 'js'
       
     end
  end
  def destroy
    @contact = Contact.find(params[:contact_id])
    @person = @contact.people.find(params[:id])
    @person.destroy
      redirect_to contact_path(params[:contact_id]), status: 303, format: 'js'
       
  end
end
 
  private
    def person_params
      params.require(:person).permit(:firstName, :lastName, :title, :mobilePhone, :emailName, :notes)
    end



