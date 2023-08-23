class AlpacasController < ApplicationController
  def index
    @alpacas = Alpaca.all
  end
end
