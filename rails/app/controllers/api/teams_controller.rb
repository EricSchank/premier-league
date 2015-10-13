class Api::TeamsController < ApplicationController
  def index
    teams = Rails.cache.fetch('/teams', expires_in: 1.day) do
      Team.refresh
      Team.all.includes(:players).to_a
    end
    render json: teams
  end

  def show
    id = params[:id]
    team = Rails.cache.fetch("/team/#{id}", expires_in: 1.day) do
      cur_team = Team.where(id: id).includes(:players).first
      Player.refresh(cur_team)
      cur_team
    end
    render json: team
  end
end
