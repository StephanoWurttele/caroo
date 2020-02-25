class CarsController < ApplicationController

  def index
    sql_query = " \
        brand @@ :query \
        OR model @@ :query \
      "
    if params[:query].present?
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
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
    params.require(:car).permit(:description, :price, :model, :kind, :brand)
  end
end
