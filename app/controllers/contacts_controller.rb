class ContactsController < ApplicationController
	def new
    	@contact = Contact.new
    end
    def edit
    	@contact = Contact.find(params[:id])
    end
    def index
        @contacts = Contact.all
    end

    def show
    	@contact = Contact.find(params[:id])
    end
    
    def create
    	@contact = Contact.new(company_params)
    	if @contact
.save
    		redirect_to @contact

    	else
    		render 'new'
    	end
    end

    def update
    	@contact = Contact.new(company_params)

    	if @contact
.save
    		redirect_to @contact

    	else 
    		render 'new'
    	end
    end

    def destroy
    	@contact = Contact.find(params[:id])
    	@contact.destroy

    	redirect_to companies_path
    end
    
    private
    def company_params
    	params.require(:contact
).permit(:contact)
    end
end
