class AlpacasController < ApplicationController
  def index
    @alpacas = Alpaca.all
  end

  def new
    @alpaca = Alpaca.new
  end
end
