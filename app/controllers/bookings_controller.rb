class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show edit destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :total_price)
  end
end
