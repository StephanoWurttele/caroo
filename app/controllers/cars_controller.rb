class CarsController < ApplicationController
  before_action :define_kinds, only: [:edit, :new]
  before_action :get_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
    @search = params["search"]
    if @search.present?
      @brand = @search[:brand]
      @cars = Car.where("brand ILIKE ?", @brand)
    end
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save!
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to car_url(@car)
  end

  def destroy
    @car.delete
    redirect_to cars_url
  end
  private

  def car_params
    params.require(:car).permit(:description, :price, :model, :kind, :brand)
  end

  def define_kinds
    @kinds = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  end

  def get_car
    @car = Car.find(params[:id])
  end
end
