class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @book = Book.find(params[:book_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = 'pending'

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def index
    @bookings = current_user.bookings
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
    params.require(:booking).permit(:book_id, :date)
  end
end
