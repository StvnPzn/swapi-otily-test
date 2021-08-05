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
        population: planet['population'],
        url: planet['url']
      )
    end
  end

  def import_species
    @data_url = 'https://swapi.dev/api/species'
    specie_results = many_data_pages

    specie_results.each do |specie|
      Specie.create!(
        name: specie['name'],
        classification: specie['classification'],
        designation: specie['designation'],
        average_height: specie['average_height'],
        skin_colors: specie['skin_colors'],
        hair_colors: specie['hair_colors'],
        eye_colors: specie['eye_colors'],
        average_lifespan: specie['average_lifespan'],
        language: specie['language'],
        url: specie['url']
      )
    end
  end

  def import_starships
    @data_url = 'https://swapi.dev/api/starships'
    starship_results = many_data_pages

    starship_results.each do |starship|
      Starship.create!(
        name: starship['name'],
        model: starship['model'],
        manufacturer: starship['manufacturer'],
        cost_in_credits: starship['cost_in_credits'],
        length: starship['length'],
        max_atmosphering_speed: starship['max_atmosphering_speed'],
        crew: starship['crew'],
        passengers: starship['passengers'],
        cargo_capacity: starship['cargo_capacity'],
        consumables: starship['consumables'],
        hyperdrive_rating: starship['hyperdrive_rating'],
        MGLT: starship['MGLT'],
        starship_class: starship['starship_class'],
        url: starship['url']
      )
    end
  end

  def import_vehicles
    @data_url = 'https://swapi.dev/api/vehicles'
    vehicle_results = many_data_pages

    vehicle_results.each do |vehicle|
      Vehicle.create!(
        name: vehicle['name'],
        model: vehicle['model'],
        manufacturer: vehicle['manufacturer'],
        cost_in_credits: vehicle['cost_in_credits'],
        length: vehicle['length'],
        max_atmosphering_speed: vehicle['max_atmosphering_speed'],
        crew: vehicle['crew'],
        passengers: vehicle['passengers'],
        cargo_capacity: vehicle['cargo_capacity'],
        consumables: vehicle['consumables'],
        vehicle_class: vehicle['starship_class'],
        url: vehicle['url']
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
