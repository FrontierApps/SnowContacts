class Timerecord < ActiveRecord::Base

	include Filterable

	belongs_to :user
	belongs_to :task

	default_scope {order('timein ASC')}
		
	scope :notimeout, -> {where('timeout IS ?', nil)} 
	scope :timethisweek, -> {where('timein > ?', d).all} 
	scope :weekstart, -> (weekstart){where('timein >= ?', weekstart).all} 
	scope :dateis, -> (date){where('timein = ?', date).all} 
	scope :weekend, -> (weekend){where('timein <= ?', weekend).all} 
	scope :currentuser, ->(user) {where('user_id = ?', user )}
	scope :selecteduser, ->(user) {where('user_id = ?', user )} 
	scope :thisjob, ->(number) {where('jobnumber = ?', number )} 
	scope :tasks_all, ->(taskid){where('task_id = ?', taskid)}
	
	def timeTotal
		if timeout?
			@timeout = timeout
		else
			@timeout = Time.zone.now
		end
		((Time.diff(timein, @timeout, '%m'))[:diff].to_f / 60).round(2)
	end
	
	def day
  		self.timein.strftime('%D')
	end

	d=Time.zone.today
	$timenow = Time.zone.now 
  	$beginning_of_this_week = d.at_beginning_of_week-1.day
  	$end_of_this_week = d.at_beginning_of_week+5.day
  	$beginning_of_last_week = d.at_beginning_of_week-8.day
  	$end_of_last_week = d.at_beginning_of_week-2.day

		
end



