require 'csv'
require 'time' 
require 'date'
require_relative './today.rb'
require_relative './switch.rb'
require_relative './show.rb'

class TimeTaskLogger
	attr_reader :time

	def initialize(argv)

		switch = Switch.new(argv)
		
		unless argv[0].eql? "--help"
			Show.content
		end
	end

end


if __FILE__ == $0
	c = TimeTaskLogger.new(ARGV)
end