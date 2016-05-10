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

    private

	def timed_out_at
		object.timeout.strftime("%I:%M %p")
	end


end
