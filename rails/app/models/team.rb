require 'httparty'

class Team < ActiveRecord::Base
  include HTTParty

  has_many :players

  SEASON_ID = 398
  CURR = '\$€£₤¥'
  CURRENCY_REGEX = /[#{CURR}]*([^#{CURR}]*)([#{CURR}]*)/
  ID_REGEX = /\/teams\/(\d+)/

  base_uri 'api.football-data.org'
  format :json
  default_params :output => 'json'

  def self.refresh
    data = get("/alpha/soccerseasons/#{SEASON_ID}/teams")
    teams = data['teams']
    teams.each do |hash|
      value = parse_money(hash['squadMarketValue'])
      id = id(hash)
      team = Team.where(data_id: id).first_or_create do |team|
        team.update(data_id: id, name: hash['name'], short_name: hash['shortName'], crest: hash['crestUrl'], code: hash['code'], value: value[0], currency: value[1])
      end
      team.update(name: hash['name'], short_name: hash['shortName'], crest: hash['crestUrl'], code: hash['code'], value: value[0], currency: value[1])
    end
  end

  def self.parse_money(money)
    r = CURRENCY_REGEX.match(money)
    [r[1].gsub(/,/, '').to_i, r[2]]
  end

  def self.id(hash)
    self_url = hash['_links']['self']['href']
    id = ID_REGEX.match(self_url)[1]
  end
end
