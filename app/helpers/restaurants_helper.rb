module RestaurantsHelper
  def can_add_rating?
    ratings = @restaurant.ratings
    return true unless ratings.any? { |rating| current_user == rating.user }
    false
  end
end
