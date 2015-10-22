class Api::PlayersController < ApplicationController
  def index
    id = params[:id]
    players = Rails.cache.fetch("/players/team/all", expires_in: 1.day) do
      Team.refresh
      Player.all.includes(:team).to_a
    end
    render json: players
  end

  def show
    id = params[:id]
    player = Rails.cache.fetch("/player/#{id}") do
      Player.where(id: id).includes(:team)
    end
    render json: player
  end
end
