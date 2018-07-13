require 'new'
require 'delete'
require 'switch'
require 'stringio'

RSpec.describe Switch do
	context "Make a new entry to csv" do	
		context "when --new is specified with no second arguments" do
			it "::NEW ENTRY:: TEST#1 :: Creating a new entry" do
			
				test_input_one = ['','test_entry']
				foo = StringIO.new
				$stdout = foo
				
				allow(STDIN).to receive(:gets) { 'yes' }

				deleteTestTask				

				newTask test_input_one

				STDOUT.puts "\t#{$stdout.string}"

				STDOUT.puts "\tInclude second arguments : #{test_input_one}"
				
				expect($stdout.string).to include 'Creating new entry:------------------->'

				STDIN.gets "\n"

				
			end
			it "::NEW ENTRY:: TEST#2 :: Exiting a new entry" do
				first_argument = []
				test_input_one = 'exit'
				foo = StringIO.new
				$stdout = foo
				# allow(STDIN).to receive(:gets) { test_input_one }
				allow(STDIN).to receive(:gets) { "yes" }
				deleteTestTask

				allow(STDIN).to receive(:gets) { "exit" }
				newTask first_argument
				
				
				STDOUT.puts "\t#{$stdout.string}"
				STDOUT.puts "\tInclude second arguments : #{test_input_one}"

				expect($stdout.string).to include 'New Entry Exited'
			end
		end
	end
end

def newTask(params)
	task = NewTask.new(params)
end

def deleteTestTask
	task = Delete.new(['','test_entry'])
end