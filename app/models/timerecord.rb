class Timerecord < ActiveRecord::Base
	include Filterable
	belongs_to :user
	belongs_to :task
		
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
			@timeout = Time.current
		end
		((Time.diff(timein, @timeout, '%m'))[:diff].to_f / 60).round(2)
	end
	
		
end



