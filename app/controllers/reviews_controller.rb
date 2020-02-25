class ReviewsController < ApplicationController
  before_action :find_car

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end


  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to car_path(@car)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to car_path(@car)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_car
    @car = Car.find(params[:car_id])
  end

end
