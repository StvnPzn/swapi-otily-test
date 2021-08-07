class Vehicle < ApplicationRecord
  has_many :films_vehicles
  has_many :films, through: :films_vehicles
  has_many :chars_vehicles
  has_many :characters, through: :chars_vehicles

  self.primary_key = 'id'
end
