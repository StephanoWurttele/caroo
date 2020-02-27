class CarsController < ApplicationController
  before_action :define_kinds, only: [:edit, :new]
  before_action :get_car, only: [:show, :edit, :update, :destroy]
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
    @booking = Booking.new
    @can_review = ->{
      return false unless signed_in?
      bookings = Booking.where(user: current_user);
      if bookings
        bookings.each do |booking|
          return true if booking.final_date < DateTime.now.to_date
        end
      end
      false
    }.call

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
    car = Car.find(params[:id])
    car.destroy
    redirect_to cars_path
  end
  private

  def car_params
    params.require(:car).permit(:description, :price, :model, :kind, :brand, :photo)
  end

  def define_kinds
    @kinds = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  end

  def get_car
    @car = Car.find(params[:id])
  end
end
