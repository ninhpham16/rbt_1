class Import
  class << self
    def call file
      begin
        Category.import(file)
      rescue StandardError => e
        puts e.message
      end
    end
  end
end
