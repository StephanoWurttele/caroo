class BookingsController < ApplicationController
  
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @owner = @booking.car.user
    @renter = @booking.user
    @car = @booking.car
  end

  def new
    @user_car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    user_car = Car.find(params[:car_id])
    @booking = Booking.new(car: user_car, user: current_user)
    if @booking.save
      redirect_to booking_url(@booking)
    else
      raise
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :car_id)
  end

end
