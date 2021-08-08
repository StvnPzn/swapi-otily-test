class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    create_visit
  end

  private

  def create_visit
    Visit.create!(
      user: current_user,
      url: @film.url
    )
  end
end
