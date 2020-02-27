class CarsController < ApplicationController
  before_action :define_kinds, only: [:edit, :new]
  before_action :get_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
    sql_query = " \
        brand @@ :brand \
        AND model @@ :model \
      "
    if params[:brand].present?
      @cars = Car.search_by_brand_and_model("#{params[:brand]} #{params[:model]}")
      #@cars = Car.where(sql_query, brand: "%#{params[:brand]}%", model: "%#{params[:model]}%")
    else
    end
  end

  def show
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
