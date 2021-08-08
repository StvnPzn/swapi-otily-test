class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
    create_visit
  end

  private

  def create_visit
    Visit.create!(
      user: current_user,
      url: @planet.url
    )
  end
end
