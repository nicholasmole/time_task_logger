require_relative './path'
require_relative './change'

class Show
	def self.fun_art
    	puts "///////////////////////////////"
      puts "-------------------------------"
      puts "|             o               |"
      puts "|             o               |"
      puts "|         O   o               |"
      puts "|           O o               |"
      puts "|             O --------      |"
      puts "|                             |"
      puts "|                             |"
      puts "-------------------------------"
      puts "///////////////////////////////"
	end

	def self.headers
		self.footer
		puts "Title        Start Time             End Time             Message            Calculated Time              "
	end

	def self.footer
    puts "-------------------------------------------------------------------------------------------"
  end

	def self.content
		self.fun_art

		if Change_CSV.check_csv_exist
      self.headers
			CSV.foreach("#{Path.get_csv_path}/#{Today.getToday}.csv", headers: false) do |row|
				self.footer 
				puts "| #{row[0]}       | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} minutes        |".center(80) 
      end
			self.footer
		else
			puts " "
			puts " "
			puts "--There is no entry for today--"
		end

	end # content
	

end