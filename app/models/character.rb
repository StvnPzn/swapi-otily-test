class Character < ApplicationRecord
  has_many :chars_films
  has_many :films, through: :chars_films
  has_many :chars_vehicles
  has_many :vehicles, through: :chars_vehicles
  has_many :chars_starships
  has_many :starships, through: :chars_starships
  has_many :chars_species
  has_many :species, through: :chars_species

  belongs_to :planet

  validates :url, presence: true

  self.primary_key = 'id'
end
