class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @alpacas = Alpaca.all
  end
end
