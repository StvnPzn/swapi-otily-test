class Planet < ApplicationRecord
  has_many :films_planets
  has_many :films, through: :films_planets
  has_many :characters

  validates :url, presence: true

  self.primary_key = 'id'
end
