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
    @booking = Booking.new
  end

  def create
    #@booking = Booking.new(booking_params)
    @booking = Booking.new()
    @booking.user = User.find(params[:booking][:user])
    @booking.car = Car.find(params[:booking][:car])
    if @booking.save
      redirect_to booking_path(@booking)
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
