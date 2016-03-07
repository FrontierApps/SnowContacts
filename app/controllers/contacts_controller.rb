class ContactsController < ApplicationController
    
	def new
    	@contact = Contact.new
    end
    def edit
    	@contact = Contact.find(params[:id])
    end
    def index
      @contacts = Contact.all
        if params[:search]
            @contact = Contact.find(params[:search])
            respond_to do |format|
                format.js { render "show" }
            end
        else

        end

    end
        
    def create
    	@contact = Contact.new(contact_params)
    	if @contact.save
    		redirect_to @contact

    	else
    		render 'new'
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
    	params.require(:contact).permit(:CompanyName)
    end
end
