class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:approve_booking, :decline_booking]

  def new
    @booking = Booking.new
    @book = Book.find(params[:book_id])
  end


  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(params[:book_id])
    @booking.user = current_user
    @booking.status = 'pending'
<<<<<<< HEAD

    @booking.book = @book
=======
    @booking.book = @book

>>>>>>> user_model
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def index
    if current_user == @booking&.book&.user
      @bookings = @booking.book.bookings
    else
      @bookings = current_user.bookings.where(status: 'pending')
    end
  end


  def approve_booking
    #if current_user == @booking.book.user
      @booking.status = "accept"
      if @booking.update(status: @booking.status)
        flash[:success] = "Booking successfully accepted"
      else
        flash[:error] = "Failed to approve booking"
      end
    # else
    #   flash[:error] = "You are not authorized to approve this booking."
    # end
    redirect_to bookings_path
  end

  def decline_booking
    if current_user == @booking.book.user
      @booking.status = "decline"
      if @booking.save
        flash[:success] = "Unfortunately, your booking is declined"
      else
        flash[:error] = "Failed to decline booking"
      end
    else
      flash[:error] = "You are not authorized to decline this booking."
    end
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
