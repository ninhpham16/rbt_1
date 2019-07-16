module Support
  class MovieTheater < ApplicationRecord
    attr_reader :theater, :movie, :room

    def theaters
      @theaters ||= Theater.pluck(:name, :id)
    end

    def movies
      @movies ||= Movie.pluck(:name, :id)
    end

    def rooms
      @rooms ||= Room.pluck(:name, :id)
    end
  end
end
