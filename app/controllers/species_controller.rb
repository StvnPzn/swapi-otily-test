class SpeciesController < ApplicationController
  def index
    @species = Specie.all
  end

  def show
    @specie = Specie.find(params[:id])
    create_visit
  end

  private

  def create_visit
    Visit.create!(
      user: current_user,
      url: @specie.url
    )
  end
end
