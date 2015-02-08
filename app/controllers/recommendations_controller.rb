require 'lunch_recommender'

class RecommendationsController < ApplicationController
  respond_to :html

  def show
    if rec = Recommendation.find_by_date(Date.today)
      @recommendation = rec
    else
      recommendation = LunchRecommender.new(current_user)
      result, recommendation = recommendation.today

      if result
        @recommendation = recommendation
        respond_with(@recommendation)
      else
        redirect_to restaurants_path, notice: "We're sorry, no recommendation available for today."
      end
    end
  end
end