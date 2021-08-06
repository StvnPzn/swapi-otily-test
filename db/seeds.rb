require 'open-uri'
require 'json'

puts 'Destroy everything first'
Film.destroy_all
Planet.destroy_all
Specie.destroy_all
Starship.destroy_all
Vehicle.destroy_all
Character.destroy_all
puts 'DB cleaned'

seed = DataImportation.new
#### FILMS IMPORTATION ####
puts 'Films importation'
seed.import_films
puts "#{Film.count} films OK"
#### PLANETS IMPORTATION ####
puts 'Planets importation'
seed.import_planets
puts "#{Planet.count} planets OK"
#### SPECIES IMPORTATION ####
puts 'Species importation'
seed.import_species
puts "#{Specie.count} species OK"
#### STARSHIPS IMPORTATION ####
puts 'Starships importation'
seed.import_starships
puts "#{Starship.count} starships OK"
#### VEHICLES IMPORTATION ####
puts 'Vehicles importation'
seed.import_vehicles
puts "#{Vehicle.count} vehicles OK"
### characters IMPORTATION ####
puts 'Characters importation'
seed.import_characters
puts "#{Character.count} characters OK"
puts 'Test des relations films/characters'
seed.film_matching
