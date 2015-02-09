require 'recommender/lunch_recommender'

class RecommendationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    if rec = Recommendation.find_by_date(Date.today)
      @recommendation = rec
    else
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