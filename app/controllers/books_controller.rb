
class BooksController < ApplicationController

  before_action :set_book, only: [:show]
  before_action :authenticate_user!, only: [:create]


  def index
    if params[:search]
      @books = Book.where("title LIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def authorize_user!
    unless current_user == @book.user
      redirect_to books_path, alert: "You are not authorized to delete this book."
    end
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
