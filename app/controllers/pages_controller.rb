class PagesController < ApplicationController
  def home
    @books = GoogleBooksService.fetch_trending_books(20)
  end
end
