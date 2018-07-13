require_relative './today'
require_relative './awaiting'
require_relative './change'
require_relative './path'

class Delete 
	attr_reader :argv
	attr_reader :gets_user_input
	attr_reader :make_sure_you_say_yes
	attr_reader :entry_is_unique

	def initialize(argv)
		if self.class.does_argument_have_key?(argv[1])

			@gets_user_input = ''

			while self.class.make_sure_value_exist?(@gets_user_input)
				@gets_user_input = Awaiting.needs_inputs("Please enter a value with your tag [or exit] \n")
			end

			unless @gets_user_input.eql? "exit"

				@make_sure_you_say_yes = ''

				while self.class.make_sure_value_exist?(@make_sure_you_say_yes) && self.class.make_sure_value_says_yes?(@make_sure_you_say_yes)
					puts " "
					puts " "
					puts "\tWarning deleting entry: "
					puts "\tPlease type \"yes\" to verify"
					@make_sure_you_say_yes = Awaiting.needs_inputs("Type \"yes\" to continue or \"no\" to exit \n")
				end

				if @make_sure_you_say_yes.eql? "yes"
					self.delete_a_csv_entry(@gets_user_input)
				else
					puts "\tdelete cancelled"
				end	
			end

		else
			@make_sure_you_say_yes = ''

			until (!self.class.make_sure_value_exist?(@make_sure_you_say_yes) && self.class.make_sure_value_says_yes?(@make_sure_you_say_yes)) do
				puts " "
				puts " "
				puts "\tWarning deleting entry: "
				puts "\tPlease type \"yes\" to verify"
				@make_sure_you_say_yes = Awaiting.needs_inputs("Type \"yes\" to continue or \"no\" to exit \n")
			end

			if @make_sure_you_say_yes.eql? "yes"
				self.delete_a_csv_entry(argv[1])
			else
				puts "\tdelete cancelled"
			end	
		end # does_argument_have_key?
	end # initialize

	def self.does_argument_have_key?(argv)
		argv.nil? || argv.empty?
	end

	def self.make_sure_value_exist?(value)
		value.nil? || value.empty?
	end

	def self.make_sure_value_says_yes?(value)
		check_answers = ['yes','y','no','n']
		check_answers.include?(value)
	end

	def delete_a_csv_entry(entry_key)
		puts "\t*** Deleting:: #{entry_key} ***"
		if Change_CSV.check_csv_exist

			updated_csv  = []

			current_csv = CSV.read("#{Path.get_csv_path}/#{Today.getToday}.csv")
			
			current_csv.each do |row|
        unless row[0].eql? entry_key
          updated_csv << row
        end
			end
			
			CSV.open("#{Path.get_csv_path}/#{Today.getToday}.csv",'w',headers: false) do |csv|
				updated_csv.each do |row|
          csv.puts row
        end
      end

		end # end check CSV
		
  end # delete_a_csv_entry
	
end