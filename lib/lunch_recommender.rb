class LunchRecommender
  def initialize(user)
    @user = user
  end

  # Attempts to create a recommendation for where a user should eat today,
  # based on a score for each restaurant in our database that takes into account
  # the last time the user visited the restaurant, and any ratings.
  #
  # Returns an array with two elements:
  # * a boolean result, and
  # * a +Recommendation+ object (if we were able to create one), else nil.
  #
  def today
    sorted_restaurants = Restaurant.all.sort_by { |restaurant| restaurant.score(@user, @user.last_visited_max) }
    recommended_restaurant = sorted_restaurants.last

    begin
      recommendation = Recommendation.new date: Date.today, restaurant: recommended_restaurant, user: @user
      if recommendation.save
        [true, recommendation]
      else
        raise
      end
    rescue
      [false, nil]
    end
  end
end