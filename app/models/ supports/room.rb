module Supports
  class Room < ApplicationRecord
    belongs_to :theater
    has_many :seats, dependent: :destroy
    has_many :movie_theaters, dependent: :destroy

    def initialize room
      @room = room
    end

    def rooms
      @rooms ||= Room.pluck(:name, :id)
    end
  end
end