# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
Book.destroy_all
User.destroy_all

user_data = [
  {username: "ElonM", password: "123456", email: "elon.musk@gmail.com", location: "52 Ashburton Road, Blackpool" }
]
User.create!(user_data)



# Clear existing records to avoid duplication when running 'rails db:seed' multiple times


# Create seed data for books
books_data = [
  { user: User.first, title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', genre: 'Classic', description: 'A novel about the American Dream.', price: "3.2",},
  { user: User.first, title: 'To Kill a Mockingbird', author: 'Harper Lee', genre: 'Fiction', description: 'A story of racial injustice and moral growth.', price: '4.1' },
  { user: User.first, title: '1984', author: 'George Orwell', genre: 'Dystopian', description: 'A dystopian novel exploring totalitarianism.', price: '5.3'},
  { user: User.first, title: 'Diary of a Wimpy Kid - Rodrick Rules', author: 'Jeff Kinney', genre: 'Pure Brilliance',
    description: "Greg's biggest problem is his big brother, Rodrick, who knows an embarrassing secret about Greg. Despite this worry, Greg continues on his goofy way, dealing with school, bullies, homework, and family, especially Rodrick. Ultimately, the secret gets out.", price: '5.3'}
]

images = ["the_great_gatsby.jpg", "to_kill_a_mockinbird.jpg", "1984.jpg", "rodrick_rules.png"]

books_data.each_with_index do |book_data, i|
  book = Book.create!(book_data)
  file_path = Rails.root.join('app', 'assets', 'images', images[i])
  book.cover_image.attach(io: File.open(file_path), filename: 'book_image.jpg')
end

puts 'Seed data for books created successfully!'
