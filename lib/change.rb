require 'csv'
require_relative './today'
require_relative './path'

class Change_CSV

	def initialize
	end

	def self.check_csv_exist
		File.exist?("#{Path.get_csv_path}/#{Today.getToday}.csv")
	end


end
