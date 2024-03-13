class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> user_model
=======
>>>>>>> customize-navbar
  def index
    if params[:search].present?
      @books = Book.where("title LIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end
  end
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> user_model
=======
>>>>>>> customize-navbar
  def show
    @books = Book.all
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
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
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
    params.require(:book).permit(:title, :genre, :author, :cover_image, :description)
>>>>>>> user_model
=======
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
    params.require(:book).permit(:title, :genre, :author, :cover_image, :description)
>>>>>>> customize-navbar
  end
end
