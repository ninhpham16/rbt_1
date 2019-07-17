class Supports::Theater < ApplicationRecord
  attr_reader :theater
  
  def initialize theater
    @theater = theater
  end

  def names
    @names ||= Theater.pluck(:name, :id)
  end
end
