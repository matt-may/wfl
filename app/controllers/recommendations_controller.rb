class RecommendationsController < ApplicationController
  require 'recommender'
  respond_to :html

  def show
    if rec = Recommendation.find_by_date(Date.today)
      @recommendation = rec
    else
      @recommendation = Recommendation.create! date: Date.today
    end
    respond_with(@recommendation)
  end
end