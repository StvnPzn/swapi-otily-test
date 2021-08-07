class Specie < ApplicationRecord
  has_many :films_species
  has_many :films, through: :films_species
  has_many :chars_species
  has_many :characters, through: :chars_species

  validates :url, presence: true

  self.primary_key = 'id'
end
