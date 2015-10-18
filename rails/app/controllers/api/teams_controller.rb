class Api::TeamsController < ApplicationController
  def index
    teams = Rails.cache.fetch('/teams', expires_in: 1.day) do
      Rails.cache.fetch('/team-refresh', expires_in: 1.day) do
        Team.refresh
      end
      Team.all.order(:name).includes(:players, :team_faves).to_a
    end
    render json: teams
  end

  def show
    id = params[:id]
    team = Rails.cache.fetch("/team/#{id}", expires_in: 1.day) do
      cur_team = Team.where(id: id).includes(:players, :team_faves).first
      Rails.cache.fetch("/team-refresh/#{id}") do
        Player.refresh(cur_team)
      end
      cur_team
    end
    render json: team
  end
end
