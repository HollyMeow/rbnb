class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show edit destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking.petsitter = @petsitter
    time_booking = @booking.date_end - @booking.date_start
    @booking.total_price = time_booking * @petsitter.price
    if @booking.save
      redirect_to petsitter_booking_path(@petsitter, @booking)
    else
      render :new
    end
  end

  def show; end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  def edit; end

  def update
    @booking.date_start = Date.parse(params[:booking][:date_start])
    @booking.date_end = Date.parse(params[:booking][:date_end])
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_start,
                                    :date_end,
                                    :total_price,
                                    :booking,
                                    :status)
  end
end
