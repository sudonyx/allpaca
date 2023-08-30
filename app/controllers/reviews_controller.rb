class ReviewsController < ApplicationController

    before_action :set_booking, only: [:new, :create]

    def new
        @booking = Booking.find(params[:booking_id])
        @review = Review.new
    end

    def create
     @review = Review.new(review_params)
     @review.booking = @booking
     @alpaca =@booking.alpaca
      if @review.save
        redirect_to alpaca_path(@alpaca)
      else
        render :new, status: :unprocessable_entity
      end
    end
   

    private 

    def set_booking
        @booking = Booking.find(params[:booking_id])
    end

    def review_params
        params.require(:review).permit(:content, :title)
    end
end
