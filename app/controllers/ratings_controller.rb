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
    update_date_params
    @rating = Rating.new(rating_params)
    @restaurant = @rating.restaurant

    if @rating.save
      redirect_to @restaurant, notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  def update
    update_date_params
    @restaurant = @rating.restaurant

    if @rating.update(rating_params)
      redirect_to @restaurant, notice: 'Rating was successfully updated.'
    else
      render :edit
    end
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

  def update_date_params
    # Ensure the date is parsed correctly to avoid an ArgumentError
    if !params[:rating][:last_visited].empty?
      params[:rating][:last_visited] = DateTime.strptime(rating_params[:last_visited], '%m/%d/%Y')
    end
  end
end
