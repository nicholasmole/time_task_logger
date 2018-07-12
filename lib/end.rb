require_relative './today'
require_relative './awaiting'
require_relative './change'
require_relative './path'

class End 
	attr_reader :argv
	attr_reader :gets_user_input
	attr_reader :entry_is_unique

	def initialize(argv)
		puts argv
		if self.class.does_argument_have_key?(argv[1])

			@gets_user_input = ''

			while self.class.make_sure_value_exist?(@gets_user_input)
				@gets_user_input = Awaiting.needs_inputs("Please enter a value with your tag [or exit] \n")
			end

			unless @gets_user_input.eql? "exit"
				self.add_end_time_to_csv_entry(@gets_user_input)
			end

		else
			self.add_end_time_to_csv_entry(argv[1])
		end # does_argument_have_key?
	end # initialize

	def self.does_argument_have_key?(argv)
		argv.nil? || argv.empty?
	end

	def self.make_sure_value_exist?(value)
		value.nil? || value.empty?
	end

	def self.create_end_time(_time)
		(Today.time_in_iso(Today.get_current_time) - Today.time_in_iso(_time)) / 60
	end

	def add_end_time_to_csv_entry(entry_key)

		@entry_is_unique = true

		if Change_CSV.check_csv_exist

			updated_csv  = []

			current_csv = CSV.read("#{Path.get_csv_path}/#{Today.getToday}.csv")
			
			current_csv.each do |row|
        if row[0].eql? entry_key
          row = [row[0], row[1], Today.get_current_time, row[3] , self.class.create_end_time(row[1]) ]
        end
        updated_csv << row
			end
			
			CSV.open("#{Path.get_csv_path}/#{Today.getToday}.csv",'w',headers: false) do |csv|
				updated_csv.each do |row|
          csv.puts row
        end
      end

    end # end check CSV

  end # add_a_message_to_csv_entry
	
end