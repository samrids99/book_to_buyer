
class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :authenticate_user!, only: [:create]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
      raise @book.errors.full_messages.inspect
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :author, :cover_image, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
