class CharsFilm < ApplicationRecord
  belongs_to :film
  belongs_to :character
end
