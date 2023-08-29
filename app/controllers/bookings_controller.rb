class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def new
    @alpaca = Alpaca.find(params[:alpaca_id])
    @booking = Booking.new
  end

  def create
    @alpaca = Alpaca.find(params[:alpaca_id])
    @booking = Booking.new(booking_params)
    @booking.alpaca = @alpaca
    @booking.user = current_user

    if @booking.save
      redirect_to alpaca_path(@alpaca)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :alpaca_id, :start_date, :end_date, :accepted)
  end
end
