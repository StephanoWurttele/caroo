class CarsController < ApplicationController

  def index
    # if params[:query]
    #   @cars = Car.where(params[:model, :type, :brand, :price])
    # else
    @cars = Car.all
    # end
    # Checking this tomorrow 25/02
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new(car_params)
  end

  def create
    if @car = Car.create(car_params)
      redirect_to car_path(@car)
    else
      render :new
    end

  end

  private

  def car_params
    params.require(:car).permit(:description, :price, :model, :type, :brand)
  end

end
