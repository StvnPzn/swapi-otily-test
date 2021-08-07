class Starship < ApplicationRecord
  has_many :films_starships
  has_many :films, through: :films_starships
  has_many :chars_starships
  has_many :characters, through: :chars_starships

  validates :url, presence: true

  self.primary_key = 'id'
end
