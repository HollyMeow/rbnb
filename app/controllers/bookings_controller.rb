class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show edit destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
  end

  def edit; end

  def update
    @booking.update(booking_params)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :total_price)
  end
end
