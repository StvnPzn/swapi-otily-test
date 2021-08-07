require 'open-uri'
require 'json'

puts 'Starting importation'

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
### Films relations IMPORTATION ####
puts 'Relation des Films avec le reste'
seed.film_matching
puts 'Relation Films/reste OK'
### Characters relations IMPORTATION ####
puts 'Relation des Characters avec le reste'
seed.character_matching
puts 'Relation Characters/reste OK'

puts 'Importation OK'
