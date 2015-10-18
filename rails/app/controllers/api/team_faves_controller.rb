class Api::TeamFavesController < ApplicationController
  def create
    data = params["data"]
    user = User.where(id: data["attributes"]["user-id"]).first
    team = Team.where(id: data["relationships"]["team"]["data"]["id"]).first
    fave = team.team_faves.where(user: user).first_or_create!
    Rails.cache.delete("/teams")
    Rails.cache.delete("/team/#{team.id}")
    render json: fave
  end

  def show
    fave = TeamFave.where(id: params[:id]).first
    render json: fave
  end

  def destroy
    team = TeamFave.where(id: params[:id]).first
    team.destroy if team
    Rails.cache.delete("/teams")
    Rails.cache.delete("/team/#{team.id}")
    head 204
  end
end
