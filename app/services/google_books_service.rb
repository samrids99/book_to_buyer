class GoogleBooksService
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'

  def self.fetch_trending_books(num_books)
    response = get("/volumes?q=subject:fiction&orderBy=newest&maxResults=#{num_books}")
    if response.success?
      JSON.parse(response.body)['items']
    else
      []
    end
  end
end
