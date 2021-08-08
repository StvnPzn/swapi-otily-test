class DashboardsController < ApplicationController
  def index
    @visits = current_user.visits
  end
end
