class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    if params[:search].present?
      @books = Book.search_by_title_and_author(params[:search])
    else
      @books = Book.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if current_user == @book.user
      @book.destroy
      redirect_to books_path, notice: 'Book was successfully deleted.'
    else
      redirect_to books_path, alert: "You are not authorized to delete this book."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :genre, :author, :cover_image, :description, :price)
  end
end
