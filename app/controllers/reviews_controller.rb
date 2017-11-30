class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking = Booking.find(params[:booking_id])
    redirect_to petsitter_booking_path(@petsitter, @booking)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
