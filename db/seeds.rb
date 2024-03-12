# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Book.destroy_all
User.destroy_all

user_data = [
  {username: "d4566", password: "123456", email: "user1@email.com", location: "Uk"}
]
User.create!(user_data)



# Clear existing records to avoid duplication when running 'rails db:seed' multiple times


# Create seed data for books
books_data = [
  { user: User.first, title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', genre: 'Classic', description: 'A novel about the American Dream.' },
  { user: User.first, title: 'To Kill a Mockingbird', author: 'Harper Lee', genre: 'Fiction', description: 'A story of racial injustice and moral growth.' },
  { user: User.first, title: '1984', author: 'George Orwell', genre: 'Dystopian', description: 'A dystopian novel exploring totalitarianism.' }
]

books_data.each do |book_data|
  Book.create!(book_data)
end

puts 'Seed data for books created successfully!'
