class Awaiting

	def initialize
	end
	
	def self.needs_inputs(_text)
		STDIN.gets.strip
	end
end