class CarsController < ApplicationController
  before_action :define_arrays, only: [:edit, :new]
  before_action :get_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
    if params[:brand].present? || params[:model].present? || params[:doors].present? || params[:year].present?
      raise
      if params[:transmission] == "Any" && params[:kind] == "Any"
        @cars = Car.search_by_not_both("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]}")
      elsif params[:transmission] == "Any"
          @cars = Car.search_by_not_transmission("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]} #{params[:kind]}")
      elsif params[:kind] == "Any"
        @cars = Car.search_by_not_kind("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]} #{params[:transmission]}")
      else
        @cars = Car.search_by_everything("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]} #{params[:transmission]} #{params[:kind]}")
      end
    elsif params[:transmission] != "Any" || params[:kind] != "Any"
      if params[:kind].present? && params[:kind] != "Any"
        @cars = Car.search_by_not_transmission("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]} #{params[:kind]}")
      elsif params[:transmission].present? && params[:transmission] != "Any"
        @cars = Car.search_by_not_kind("#{params[:brand]} #{params[:model]} #{params[:doors]} #{params[:year]} #{params[:transmission]}")
      end
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

  def define_arrays
    @kinds = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
    @trans = ['Manual', 'automatic']

  
  end

  def get_car
    @car = Car.find(params[:id])
  end
end
