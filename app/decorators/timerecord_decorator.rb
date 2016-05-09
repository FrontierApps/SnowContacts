class TimerecordDecorator < Draper::Decorator
	delegate_all
	decorates :timerecord
 def timed_out_status
		if timeout?
			"#{timed_out_at}"
		else
			Time.now.strftime("%I:%M %p")
		end
 end
 def Total_time
 	"#{total_figure}"
 end

    private

	def timed_out_at
		object.timeout.strftime("%I:%M %p")
	end

	def total_figure
		"#{timed_out_status}" - object.timein
		
	end

end
