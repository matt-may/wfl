require 'recommender/lunch_recommender'

class RecommendationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    rec = Recommendation.where(date: Date.today, user: current_user)
    if rec != []
      @recommendation = rec.first
    elsif Restaurant.count > 0
      recommendation = LunchRecommender.new(current_user)
      result, recommendation = recommendation.today

      if result
        @recommendation = recommendation
      else
        redirect_to restaurants_path, notice: "We're sorry, no recommendation available for today."
      end
    end
  end
end