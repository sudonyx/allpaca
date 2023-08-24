class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @alpacas = Alpaca.all
  end

  private

  def alpaca_params
    params.require(:alpaca).permit(:name, :colour, :hat, :location, :price_per_night, :user_id, :photo)
  end
end
