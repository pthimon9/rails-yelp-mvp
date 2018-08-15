class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  # def edit
  # end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save!
    redirect_to restaurant_path(@restaurant)
    # respond_to do |format|
    #   if @restaurant.save
    #     format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
    #     format.json { render :show, status: :created, location: @restaurant }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @restaurant.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # def update
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(restaurant_params)
  #   redirect_to restaurant_path(@restaurant)
  # #   respond_to do |format|
  #     if @restaurant.update(restaurant_params)
  #       format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @restaurant }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @restaurant.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @restaurant.destroy
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
