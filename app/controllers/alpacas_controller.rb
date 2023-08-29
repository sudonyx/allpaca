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
      if params[:alpaca][:image].present?
        result = Cloudinary::Uploader.upload(params[:alpaca][:image_url])
        @alpaca.update(image_url: result['secure_url'])
      end
      redirect_to @alpaca, notice: 'Alpaca was successfully created!'
    else
      render :new
    end
  end
  
  def show
    @alpaca = Alpaca.find(params[:id])
  end

  def destroy
    @alpaca = Alpaca.find(params[:id])
    @alpaca.destroy
    redirect_to alpacas_path
  end

  private

  def alpaca_params
    params.require(:alpaca).permit(:name, :colour, :hat, :location, :price_per_night, :user_id)
  end
end
