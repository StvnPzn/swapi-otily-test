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
    planet_results = many_data_pages

    planet_results.each do |planet|
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
    specie_results = many_data_pages

    specie_results.each do |specie|
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
    starship_results = many_data_pages

    starship_results.each do |starship|
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
    vehicle_results = many_data_pages

    vehicle_results.each do |vehicle|
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
        vehicle_class: vehicle['vehicle_class'],
        url: vehicle['url']
      )
    end
  end

  def import_characters
    @data_url = 'https://swapi.dev/api/people'
    @people_results = many_data_pages

    @people_results.each do |person|
      Character.create!(
        id: person['url'].split('/').last.to_i,
        name: person['name'],
        height: person['height'],
        mass: person['mass'],
        hair_color: person['hair_color'],
        skin_color: person['skin_color'],
        eye_color: person['eye_color'],
        birth_year: person['birth_year'],
        gender: person['gender'],
        planet: Planet.find(person['homeworld'].split('/').last.to_i),
        url: person['url']
      )
    end
  end

  def film_matching
    @film_results.each do |film|
      current_film = Film.find(film['url'].split('/').last.to_i)
      film['characters'].each do |character|
        current_film.characters << Character.find(character.split('/').last.to_i)
      end
      film['planets'].each do |planet|
        current_film.planets << Planet.find(planet.split('/').last.to_i)
      end
      film['starships'].each do |starship|
        current_film.starships << Starship.find(starship.split('/').last.to_i)
      end
      film['vehicles'].each do |vehicle|
        current_film.vehicles << Vehicle.find(vehicle.split('/').last.to_i)
      end
      film['species'].each do |specie|
        current_film.species << Specie.find(specie.split('/').last.to_i)
      end
      current_film.save
    end
  end

  def character_matching
    @people_results.each do |person|
      current_person = Character.find(person['url'].split('/').last.to_i)
      if !person['vehicles'].empty?
        person['vehicles'].each do |vehicle|
          current_person.vehicles << Vehicle.find(vehicle.split('/').last.to_i)
        end
      end
      if !person['starships'].empty?
        person['starships'].each do |starship|
          current_person.starships << Starship.find(starship.split('/').last.to_i)
        end
      end
      if !person['species'].empty?
        person['species'].each do |specie|
          current_person.species << Specie.find(specie.split('/').last.to_i)
        end
      end
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
