class Api::TeamsController < ApplicationController
  def index
    teams = Rails.cache.fetch('/teams', expires_in: 1.day) do
      Team.refresh
      Team.all
    end
    render json: teams
  end

  def show
    id = params[:id]
    team = Rails.cache.fetch("/team/#{id}", expires_in: 1.day) do
      cur_team = Team.where(id: id)
      Player.refresh(cur_team)
    end
    render json: team
  end
end
