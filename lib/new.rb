require_relative './today'
require_relative './awaiting'
require_relative './change'
require_relative './path'

class NewTask 
	attr_reader :argv
	attr_reader :gets_user_input
	attr_reader :entry_is_unique

	def initialize(argv)

		if self.class.does_argument_have_key?(argv[1])

			@gets_user_input = ''

			while self.class.make_sure_value_exist?(@gets_user_input)
				@gets_user_input = Awaiting.needs_inputs("Please enter a value with your tag [or exit] \n")
			end

			unless @gets_user_input.eql? "exit"
				self.make_a_new_csv_entry(@gets_user_input)
			else
				puts "\tNew Entry Exited"
			end


		else
			self.make_a_new_csv_entry(argv[1])
		end # does_argument_have_key?
	end # initialize

	def self.does_argument_have_key?(argv)
		argv.nil? || argv.empty?
	end

	def self.make_sure_value_exist?(value)
		value.nil? || value.empty?
	end

	def make_a_new_csv_entry(entryName)
		@entry_is_unique = true
		puts "\tCreating new Entry:: #{entryName}"
		if Change_CSV.check_csv_exist
			CSV.foreach("#{Path.get_csv_path}/#{Today.getToday}.csv", headers: false) do |row|
			
				if row[0].eql? entryName
          puts "\t*** This entry already exist ***"
          @entry_is_unique = false
				end
				
      end
    end

		unless !@entry_is_unique
      puts "\tCreating new entry:-------------------> "
      CSV.open("#{Path.get_csv_path}/#{Today.getToday}.csv",'a+',headers: false) do |csv|
        csv << [entryName, Today.get_current_time, "--endtime--", "--notes empty--", "---calc time---"]
			end
    end
  end # make_a_new_csv_entry
	
end