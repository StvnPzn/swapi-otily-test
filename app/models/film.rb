class Film < ApplicationRecord
  has_many :chars_films
  has_many :characters, through: :chars_films
  has_many :films_planets
  has_many :planets, through: :films_planets
  has_many :films_species
  has_many :species, through: :films_species
  has_many :films_starships
  has_many :starships, through: :films_starships
  has_many :films_vehicles
  has_many :vehicles, through: :films_vehicles

  validates :title, presence: true
  validates :url, presence: true

  self.primary_key = 'id'
end
