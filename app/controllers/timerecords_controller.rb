class TimerecordsController < ApplicationController
  def index
  	  	@beginning_of_last_week = Date.today.at_beginning_of_week-8.day
		@end_of_last_week = Date.today.at_beginning_of_week-2.day  	  
      if params[:user_id]
        @timerecords = Timerecord.selecteduser(params[:user_id]).timethisweek.decorate
        @user = params[:first_name]
      else
        @timerecords = current_user.timerecords.timethisweek.decorate
        @user = current_user.firstname
      end
  end
  def date_range
  	

  end
end