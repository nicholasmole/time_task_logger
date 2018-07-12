require 'time'
require 'date'

class Today

	def self.get_current_time
		Time.now.iso8601
	end

	def self.getToday
		Time.now.strftime("%d-%m-%Y");
	end

	def self.time_in_iso(_time)
		Time.iso8601(_time).to_i
	end

end
