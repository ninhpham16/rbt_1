class Import
  class << self
    def call file
      Category.import(file)
    rescue StandardError => e
      puts e.message
    end
  end
end
