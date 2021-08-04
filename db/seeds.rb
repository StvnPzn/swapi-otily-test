require "open-uri"
require "json"

'Destroy everything first'
Film.destroy_all

puts 'Creating the 6 films with API'
url = 'https://swapi.dev/api/films'
film_serialized = URI.open(url).read
films = JSON.parse(film_serialized)

films['results'].each do |film|
  Film.create!(
    title: film['title'],
    episode_nul: film['episode_id'],
    opening_crawl: film['opening_crawl'],
    director: film['director'],
    producer: film['producer'],
    release_date: film['release_date'],
    url: film['url']
  )
  puts 'Film OK'
end
