class UserDecorator < Draper::Decorator
  delegate_all
	def timed_out_status
		if timeout?
			"#{timed_out_at}"
		else
			Time.current
		end
	end

	def timed_out_at
		timeout.strftime("%I:%M %p")
	end

end
