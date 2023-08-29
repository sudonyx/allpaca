class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @alpacas = Alpaca.all
  end

  def new
    @alpaca = Alpaca.new
  end

  def create
    @alpaca = Alpaca.new(alpaca_params)

    if @alpaca.save
      redirect_to @alpaca, notice: 'Alpaca was successfully created!'
    else
      render :new
    end
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    @reviews = @alpaca.reviews
    @review = Review.new
    @alpaca_booking = @alpaca.bookings.find_by(user: current_user)
    if @alpaca_booking
    @booking = Booking.find(@alpaca_booking.id)
    end
  end

  def destroy
    @alpaca = Alpaca.find(params[:id])
    @alpaca.destroy
    redirect_to alpacas_path
  end

  private

  def alpaca_params
    params.require(:alpaca).permit(:name, :colour, :hat, :location, :price_per_night, :user_id, :photo)
  end
end
