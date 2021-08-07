class FilmsVehicle < ApplicationRecord
  belongs_to :film
  belongs_to :vehicle
end
