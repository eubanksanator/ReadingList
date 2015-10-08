class Genre < ActiveRecord::Base
   has_many :books_genres
   has_many :books, through: :book_genres
end
