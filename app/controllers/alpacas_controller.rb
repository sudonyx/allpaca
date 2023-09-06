class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :hat_search]

  def index
    @alpacas = Alpaca.all
  end

  def new
    @alpaca = Alpaca.new
  end

  def create
    @alpaca = Alpaca.new(alpaca_params)
    @alpaca.user = current_user

    if @alpaca.save
      redirect_to alpacas_path, notice: 'Alpaca was successfully created!'
    else
      render :new, status: :unprocessable_entity
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

    @alpaca.destroy if @alpaca.user == current_user
    redirect_to user_profile_path
  end

  def hat_search
    p params[:hat]
    @alpacas = Alpaca.where(hat: params[:hat])
  end

  private

  def alpaca_params
    params.require(:alpaca).permit(:name, :colour, :hat, :location, :price_per_night, :photo)
  end
end
