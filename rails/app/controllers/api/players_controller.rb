class Api::PlayersController < ApplicationController
  def index
    id = params[:id]
    players = Rails.cache.fetch("/players/team/#{id}", expires_in: 1.day) do
      if id.blank?
        Player.all
      else
        Player.where(team_id: id)
      end
    end
    render json: players
  end

  def show
    id = params[:id]
    player = Rails.cache.fetch("/player/#{id}") do
      Player.where(id: id)
    end
    render json: player
  end
end
