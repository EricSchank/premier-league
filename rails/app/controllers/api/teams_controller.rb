class Api::TeamsController < ApplicationController
  def index
    render json: Team.all
  end

  def show
    render json: Team.where(id: params[:id])
  end
end
