class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:show, :edit]
  respond_to :html

  def show
    respond_with(@rating)
  end

  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def edit
  end

  def create
    # Ensure the date is parsed correctly to avoid an ArgumentError
    if !params[:rating][:last_visited].empty?
      params[:rating][:last_visited] = DateTime.strptime(rating_params[:last_visited], '%m/%d/%Y')
    end

    @rating = Rating.new(rating_params)
    @rating.save
    @restaurant = @rating.restaurant
    respond_with(@restaurant)
  end

  def update
    @rating.update(rating_params)
    @restaurant = @rating.restaurant
    respond_with(@restaurant)
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def set_restaurant
      @restaurant = @rating.restaurant
    end

    def rating_params
      params.require(:rating).permit(:rate, :user_id, :restaurant_id, :last_visited)
    end
end
