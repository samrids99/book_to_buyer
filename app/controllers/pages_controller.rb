# app/controllers/pages_controller.rb
require_relative '../../app/services/google_books_service'

class PagesController < ApplicationController
  def home
    @books = GoogleBooksService.fetch_trending_books(20)
  end
end
