require 'httparty'

class Player < ActiveRecord::Base
  include HTTParty

  belongs_to :team

  SEASON_ID = 398
  CURR = '\$€£₤¥'
  CURRENCY_REGEX = /[#{CURR}]*([^#{CURR}]*)([#{CURR}]*)/

  base_uri 'api.football-data.org'
  format :json
  default_params :output => 'json'

  # TODO: Need to handle removing players that were traded or retired or let go
  def self.refresh(team)
    data = get("/alpha/teams/#{team.id}/players")
    players = data['players']
    players.each do |hash|
      value = parse_money(hash['marketValue'])
      player = team.players.where(data_id: hash['id']).first_or_create do |player|
        update_player(player, hash, value)
      end
      update_player(player, hash, value)
    end
  end

  def self.update_player(player, hash, value)
    player.update(
      data_id: hash['id'],
      name: hash['name'],
      position: hash['position'],
      jersey_number: hash['jerseyNumber'],
      birth: hash['birthDate'],
      nationality: hash['nationality'],
      contract: hash['contractDate'],
      value: value[0],
      currency: value[1]
    )
  end

  def self.parse_money(money)
    r = CURRENCY_REGEX.match(money)
    [r[1].gsub(/,/, '').to_i, r[2]]
  end
end
