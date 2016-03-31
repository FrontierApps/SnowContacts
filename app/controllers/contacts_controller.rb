class ContactsController < ApplicationController
    
	def new
    	@contact = Contact.new
    end
    def edit
    	@contact = Contact.find(params[:id])
    end
    
    def index
      @location = Location.new
      @person = Person.new
      if params[:id]
      @contact = Contact.find(params[:id])
          respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
          end
      else
      end
    end

    def show
    @contact = Contact.find(params[:id])
    @location = Location.new
    @person = Person.new
        respond_to do |format|
          format.html { render "show" }
          format.js { render "show" }
        end
    end
        
    def create
    	@contact = Contact.new(contact_params)
    	if @contact.save
    		respond_to do |format|
                format.js { render "show" }
            end
    	else
    		
    	end
    end

    def update
    	@contact = Contact.find(params[:id])
    	if @contact.update(contact_params)
            respond_to do |format|
                format.js { render "show" }
            end
    	
        else 
            
    	end
    end

    def destroy
    	@contact = Contact.find(params[:id])
    	@contact.destroy

    	redirect_to contacts_path
    end
    
    private
    def contact_params
    	params.require(:contact).permit(:CompanyName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone, :FaxNumber)
    end
end
