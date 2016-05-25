class TimerecordsController < ApplicationController
 	

  def index
  	if current_user.admin?
  		    	
	else
		params[:selecteduser] = current_user.id
		
	end
		@timerecords = Timerecord.filter(params.slice(:selecteduser, :weekstart, :weekend)).decorate
    	@user = User.find(params[:selecteduser])
  end

	def new				
		time = Timerecord.currentuser(current_user.id).notimeout.exists?

		if time
			@exist_timerecord = Timerecord.currentuser(current_user.id).notimeout.first

			if (@exist_timerecord.jobnumber == params[:job_id])
				redirect_to :action => 'timeout', :id => @exist_timerecord.id, :selecteduser => current_user.id	

			else
				@old_timerecord = Timerecord.find_by(id: @exist_timerecord.id)
				flash[:notice] = "You were just timed out of job number "+ @exist_timerecord.jobnumber
				@old_timerecord.update(timeout: Time.zone.now)
				@timerecord = Timerecord.new	    
				@timerecord.jobnumber = params[:job_id]
			end

		else 		  
			@timerecord = Timerecord.new	    
			@timerecord.jobnumber = params[:job_id]
		end
	end

	def create
		time = Timerecord.currentuser(current_user.id).notimeout.exists?
		if time
			@exist_timerecord = Timerecord.currentuser(current_user.id).notimeout.first
			redirect_to :action => 'timeout', :id => @exist_timerecord.id, :selecteduser => current_user.id	
		else
			@timenow = Time.zone.now 
			@timerecord = Timerecord.new(timerecord_params)
			@timerecord.user_id = current_user.id
			@timerecord.timein = @timenow
			@timerecord.save

			if @timerecord.save
				redirect_to timerecords_path(:selecteduser => current_user.id, :weekstart => $beginning_of_this_week, :weekend => $end_of_this_week)

			else
			render 'new'
			end
		end
	end

	def timeout

		@timerecord = Timerecord.find(params[:id])
		@task = Task.find(@timerecord.task_id)

	end

	def edit

		@timerecord = Timerecord.find(params[:id])
		@task = Task.find(@timerecord.task_id)
		
	end	
	def add_timerecord
		@timerecord = Timerecord.new		
		
		
	end
	def update
		@timerecord = Timerecord.find(params[:id])
		if @timerecord.update(timerecord1_params)
			redirect_to timerecords_path(:selecteduser => @timerecord.user_id, :weekstart => $beginning_of_this_week, :weekend => $end_of_this_week)
		else
			render 'edit'
		end
	end




private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:selecteduser, :weekstart, :weekend)
end

def timerecord_params
		params.require(:timerecord).permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
end

def timerecord1_params
	params.permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
end

end