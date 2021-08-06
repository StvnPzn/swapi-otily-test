class DataImportation < ApplicationRecord
  attr_accessor :data_url

  def import_films
    @data_url = 'https://swapi.dev/api/films'
    @film_results = many_data_pages

    @film_results.each do |film|
      Film.create!(
        id: film['url'].split('/').last.to_i,
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
    @planet_results = many_data_pages

    @planet_results.each do |planet|
      Planet.create!(
        id: planet['url'].split('/').last.to_i,
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
    @specie_results = many_data_pages

    @specie_results.each do |specie|
      Specie.create!(
        id: specie['url'].split('/').last.to_i,
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
    @starship_results = many_data_pages

    @starship_results.each do |starship|
      Starship.create!(
        id: starship['url'].split('/').last.to_i,
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
    @vehicle_results = many_data_pages

    @vehicle_results.each do |vehicle|
      Vehicle.create!(
        id: vehicle['url'].split('/').last.to_i,
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

  def import_characters
    @data_url = 'https://swapi.dev/api/people'
    @people_results = many_data_pages

    @people_results.each do |people|
      Character.create!(
        id: people['url'].split('/').last.to_i,
        name: people['name'],
        height: people['height'],
        mass: people['mass'],
        hair_color: people['hair_color'],
        skin_color: people['skin_color'],
        eye_color: people['eye_color'],
        birth_year: people['birth_year'],
        gender: people['gender'],
        url: people['url']
      )
    end
  end
  #### STARTING FROM HERE : this part was coded without test following the API death

  def film_matching
    @film_results.each do |film|
      current_film = Film.find(film['url'].split('/').last.to_i)
      film['characters'].each do |character|
        current_film.characters << Character.find(character.split('/').last.to_i)
      end
      current_film.save
    end
  end
  ## --> si ce bloc de code fonctionne, j'itere ensuite pour associer les species,
  ## --> planete, etc (en prenant en compte que ça peut parfois etre empty
  ## --> et appliquer mon scheme de BDD (+ creation des tables de jonction necessaires)
  #### END

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
