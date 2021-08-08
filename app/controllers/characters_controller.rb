class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    create_visit
  end

  private

  def create_visit
    Visit.create!(
      user: current_user,
      url: @character.url
    )
  end
end
