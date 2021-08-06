class Film < ApplicationRecord
  has_many :chars_films
  has_many :characters, through: :chars_films
end
