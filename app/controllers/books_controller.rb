class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy]
  before_action :authorize_user!, only: :destroy

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
end
