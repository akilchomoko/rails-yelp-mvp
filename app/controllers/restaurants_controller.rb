class RestaurantsController < ApplicationController
  # Comments
  before_action :set_restaurant, only: [:edit, :show, :destroy, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit; end

  def update
    @restaurant.update(params_restaurant)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant.delete
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
