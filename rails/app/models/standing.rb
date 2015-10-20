require 'httparty'

class Standing < ActiveRecord::Base
  include HTTParty

  belongs_to :team

  base_uri 'api.football-data.org'
  format :json
  default_params :output => 'json'
  headers 'X-Auth-Token' => ENV['SOCCER_API']

  SEASON_ID = 398

  def self.refresh
    data = get("/alpha/soccerseasons/#{SEASON_ID}/leagueTable")
    standings = data['standing']
    standings.each do |hash|
      team_url = hash['_links']['team']['href']
      tid = /.*\/(\d+)/.match(team_url)[1]
      team = Team.where(data_id: tid).first

      standing = team.standing
      standing.destroy if standing
      standing = team.create_standing!(
        position: hash['position'],
        played_games: hash['playedGames'],
        points: hash['points'],
        goals: hash['goals'],
        goals_against: hash['goalsAgainst'],
        goal_difference: hash['goalDifference']
      )
    end
  end

end
