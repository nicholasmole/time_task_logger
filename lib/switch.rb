require_relative './new'
require_relative './message'
require_relative './end'
require_relative './help'
require_relative './delete'

class Switch

	def initialize(argv)
		if self.class.do_you_have_arguments?(argv)
			self.class.switch(argv)
		end
	end

	def self.do_you_have_arguments?(argv)
		argv.size > 0
	end

	def self.switch(argv)
		case argv[0]
		when "--new" , "-n"
			NewTask.new(argv)
		when "--message", "--m", "-m"
			Message.new(argv)
		when "--end", "--stop", "-s", "-e", "-nd"
			End.new(argv)
		when "--delete"
			Delete.new(argv)
		when "--help"
			Help.help
		else
		
		end
		
	end

end