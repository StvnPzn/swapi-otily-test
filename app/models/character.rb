class Character < ApplicationRecord
  has_many :chars_films
  has_many :films, through: :chars_films

  self.primary_key = 'id'
end
