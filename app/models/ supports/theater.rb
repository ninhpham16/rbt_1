module Supports
  class Theater < ApplicationRecord
    attr_reader :theater
    belongs_to :city
    has_many :rooms, dependent: :destroy

    validates :name, presence: true
    validates :city_id, presence: true
    
    def initialize theater 
      @theater = theater
    end

    def theaters
      @theaters ||= Theater.pluck(:name, :id)
    end
  end
end
