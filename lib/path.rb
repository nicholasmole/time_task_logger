class Path
	def self.get_csv_path
		File.join(File.dirname(__dir__), "csv_files")
	end
end
