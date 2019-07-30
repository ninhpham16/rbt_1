module Supports
  class Movie < ApplicationRecord
    attr_accessor :movie

    def findReview movie
      @reviews ||= movie.reviews.order("created_at asc")
    end

    def newReview movie
      @review ||= movie.reviews.build
    end

    def findComment movie
      @comments ||= movie.comments.where(parent_id: nil).order(created_at: :desc)
    end

    def comment_id comments
      @comment_id ||= comments.pluck(:id)
    end

    def findReply comment_id
      @replies ||= Comment.where(parent_id: comment_id)
    end

    def newComment
      @comment ||= Comment.new
    end

    def rate movie, current_user
      @rate ||= movie.reviews.where(user_id: current_user.id) if current_user
    end
  end
end
