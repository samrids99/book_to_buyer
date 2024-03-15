class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @book = Book.find(params[:book_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(params[:book_id])
    @booking.user = current_user
    @booking.status = 'pending'

    @booking.book = @book
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def index
    @users = User.all
    @bookings = current_user.bookings
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def approve_booking
    @booking = Booking.find_by_id(params[:id])
     @booking.status = "approved"
     if @booking.status == "approved"
       flash[:success] = "Booking successfully approved"
       redirect_to bookings_path
     end
  end

  def decline_booking
    @booking = Booking.find_by_id(params[:id])
     @booking.status = "declined"
     if @booking.status == "declined"
       flash[:success] = "Unfortunately, your booking is declined"
       redirect_to bookings_path
     end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
