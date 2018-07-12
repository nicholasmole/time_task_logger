require 'new'
require 'switch'
require 'stringio'

RSpec.describe Switch do
	context "Make a new entry to csv" do	
		context "when --new is specified with no second arguments" do
			it "Second arguments is inputed with GOOD INPUT" do
				first_argument = ['--new']
				test_input_one = 'test_entry'
				foo = StringIO.new
				$stdout = foo
				allow(STDIN).to receive(:gets) { test_input_one }
				
				newTask first_argument
				
				STDOUT.puts "\t#{$stdout.string}"
				STDOUT.puts "\tInclude second arguments : #{test_input_one}"

				expect($stdout.string).to include 'Please enter a value with your tag [or exit]'
			end
			it "Second arguments is inputed with EXIT INPUT" do
				first_argument = ['--new']
				test_input_one = 'exit'
				foo = StringIO.new
				$stdout = foo
				allow(STDIN).to receive(:gets) { test_input_one }
				
				newTask first_argument
				
				
				STDOUT.puts "\t#{$stdout.string}"
				STDOUT.puts "\tInclude second arguments : #{test_input_one}"

				expect($stdout.string).to include 'New Entry Exited'
			end

			it "Third arguments is inputed with TWO INPUT" do
				first_argument = ['--new' , 'test_entry']
				foo = StringIO.new
				$stdout = foo
				# allow(STDIN).to receive(:gets) { input }

				
				newTask first_argument
				
				
				STDOUT.puts "\t#{$stdout.string}"
				# STDOUT.puts "\tInclude second arguments : #{input}"

				expect($stdout.string).to include 'Creating new entry:-------------------> '
			end
		end

		# it "when --new is specified with no second arguments" do
		# 	arg = ['--new']
		# 	input = 'joe'
		# 	foo = StringIO.new
		# 	$stdout = foo
		# 	allow(STDIN).to receive(:gets) { input }
			
		# 	newTask arg
			
		# 	STDOUT.puts "\tInclude second arguments : #{input}"
		# 	STDOUT.puts $stdout.string

		# 	expect($stdout.string).to include 'Please enter a value with your tag [or exit]'
		# end

	end
end

def newTask(params)
	task = Switch.new(params)
	task
end

# def deleteTestTask(params)