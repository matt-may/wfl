class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:show, :edit]
  respond_to :html

  def index
    @ratings = Rating.all
    respond_with(@ratings)
  end

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
    @rating = Rating.new(rating_params)
    @rating.save
    @restaurant = @rating.restaurant
    respond_with(@restaurant)
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
  end

  def destroy
    @rating.destroy
    respond_with(@rating)
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def set_restaurant
      @restaurant = @rating.restaurant
    end

    def rating_params
      params.require(:rating).permit(:rate, :user_id, :restaurant_id)
    end
end
