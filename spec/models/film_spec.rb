require 'rails_helper'

RSpec.describe Film, type: :model do
  it 'is valid with title and url' do
    film = Film.new(
      title: 'A New Hope',
      producer: 'Gary Kurtz, Rick McCallum',
      director: 'George Lucas',
      url: 'https://swapi.dev/api/films/1/'
    )
    expect(film).to be_valid
  end

  it 'is invalid without url' do
    film = Film.new(url: nil)
    film.valid?
    expect(film.errors[:url]).to include('can\'t be blank')
  end

  it 'returns a title as string' do
    film = Film.new(
      title: 'A New Hope',
      producer: 'Gary Kurtz, Rick McCallum',
      director: 'George Lucas',
      url: 'https://swapi.dev/api/films/1/'
    )
    expect(film.title).to eq 'A New Hope'
  end

  ### En plus d'appliquer ces vérifications simples sur chacun des models, avec plus de pratique et de connaissances sur RSpec, j'aurais ajouté :
  ### -- test sur les creations de classes
  ### -- test sur GET request via l'API
end
