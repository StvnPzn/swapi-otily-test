class DataImportation < ApplicationRecord
  attr_accessor :data_url

  def import_films(url)
    film_serialized = URI.open(url).read
    films = JSON.parse(film_serialized)

    films['results'].each do |film|
      Film.create!(
        title: film['title'],
        episode_num: film['episode_id'],
        opening_crawl: film['opening_crawl'],
        director: film['director'],
        producer: film['producer'],
        release_date: film['release_date'],
        url: film['url']
      )
    end
  end

  def import_planets
    @data_url = 'https://swapi.dev/api/planets'
    planet_results = many_data_pages

    planet_results.each do |planet|
      Planet.create!(
        name: planet['name'],
        rotation_period: planet['rotation_period'],
        orbital_period: planet['orbital_period'],
        diameter: planet['diameter'],
        climate: planet['climate'],
        gravity: planet['gravity'],
        terrain: planet['terrain'],
        population: planet['population']
      )
    end
  end

  private

  def many_data_pages
    datas = []
    until @data_url.nil?
      data_serialized = URI.open(@data_url).read
      data_page = JSON.parse(data_serialized)

      data_page['results'].each do |result|
        datas << result
      end

      @data_url = data_page['next']
    end
    datas
  end
end
