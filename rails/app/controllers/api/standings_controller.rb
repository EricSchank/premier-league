class Api::StandingsController < ApplicationController
  def index
    id = params[:id]
    standings = Rails.cache.fetch("/standings/team/all", expires_in: 1.day) do
      Team.refresh
      Standing.all.includes(:team).to_a
    end
    render json: standings
  end

  def show
    id = params[:id]
    standing = Rails.cache.fetch("/standing/#{id}") do
      Standing.where(id: id).includes(:team).first
    end
    render json: standing
  end
end
