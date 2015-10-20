class Api::StandingsController < ApplicationController
  def index
    id = params[:id]
    standings = Rails.cache.fetch("/standings/team/#{id ? id : 'all'}", expires_in: 1.day) do
      if id.blank?
        Team.refresh
        Standing.all.includes(:team).to_a
      else
        Standing.where(team_id: id).includes(:team).to_a
      end
    end
    render json: standings
  end

  def show
    id = params[:id]
    standing = Rails.cache.fetch("/standing/#{id}") do
      Standing.where(id: id).includes(:team)
    end
    render json: standing
  end
end
