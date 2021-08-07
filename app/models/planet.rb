class Planet < ApplicationRecord
  has_many :films_planets
  has_many :films, through: :films_planets
  has_many :characters

  self.primary_key = 'id'
end
