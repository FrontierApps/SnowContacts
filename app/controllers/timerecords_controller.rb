class TimerecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    
  	  @timerecords = Timerecord.filter(params.slice(:selecteduser, :weekstart, :weekend)).decorate

   	 	@beginning_of_last_week = Date.today.at_beginning_of_week-8.day
   		@end_of_last_week = Date.today.at_beginning_of_week-2.day  	  
  #     if params[:user_id]
  #       @timerecords = Timerecord.selecteduser(params[:user_id]).timethisweek.decorate
  #       @user = params[:first_name]
  #     else
  #       @timerecords = current_user.timerecords.timethisweek.decorate
  #       @user = current_user.firstname
  #     end
  end
private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:selecteduser, :weekstart, :weekend)
end

end