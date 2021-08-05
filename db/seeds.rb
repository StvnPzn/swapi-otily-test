require 'open-uri'
require 'json'

'Destroy everything first'
Film.destroy_all
Planet.destroy_all
'DB cleaned'

seed = DataImportation.new
#### FILMS IMPORTATION ####
puts 'Films importation'
seed.import_films('https://swapi.dev/api/films')
puts "#{Film.count} films OK"
#### PLANETS IMPORTATION ####
puts 'Planets importation'
seed.import_planets
puts "#{Planet.count} planets OK"
