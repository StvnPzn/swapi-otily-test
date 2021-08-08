class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    create_visit
  end

  private

  def create_visit
    Visit.create!(
      user: current_user,
      url: @vehicle.url
    )
  end
end
