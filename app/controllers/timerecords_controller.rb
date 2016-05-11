class TimerecordsController < ApplicationController
  def index
  	  
      if params[:user_id]
        @timerecords = Timerecord.selecteduser(params[:user_id]).timethisweek.decorate
        @user = params[:first_name]
      else
        @timerecords = current_user.timerecords.timethisweek.decorate
        @user = current_user.firstname
      end
  end
end