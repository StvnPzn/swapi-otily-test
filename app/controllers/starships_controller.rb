class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
    create_visit
  end

  private

  def create_visit
    new_visit = Visit.create!(
      user: current_user,
      url: @starship.url
    )
  end
end
