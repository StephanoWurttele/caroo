class CarsController < ApplicationController

  def index
    @cars = Car.all
    @search = params["search"]

    if @search.present?
      @brand = @search[:brand]
      @cars = Car.where("brand ILIKE ?", @brand)
    end
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
