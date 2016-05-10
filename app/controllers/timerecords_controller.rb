class TimerecordsController < ApplicationController
  def index
  	  @timerecords = current_user.timerecords.timethisweek.decorate
      if params[:id]
      @contact = Contact.find(params[:user_id])
          respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
          end
      else
      end
  end
end