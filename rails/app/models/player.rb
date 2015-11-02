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
  headers 'X-Auth-Token' => ENV['SOCCER_API']

  # TODO: Need to handle removing players that were traded or retired or let go
  def self.refresh(team)
    data = get("/alpha/teams/#{team.data_id}/players")
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
    pos = translate_position(hash['position'])
    nat = translate_nationality(hash['nationality'])
    player.update(
      data_id: hash['id'],
      name: hash['name'],
      position: pos,
      jersey_number: hash['jerseyNumber'],
      birth: hash['birthDate'],
      nationality: nat,
      contract: hash['contractDate'],
      value: value[0],
      currency: value[1]
    )
  end

  def self.translate_position(pos)
    case pos
    when 'Torwart'
      'Keeper'
    when 'Rechter Verteidiger'
      'Right-Back'
    when 'Linker Verteidiger'
      'Left-Back'
    when 'Innenverteidiger'
      'Centre Back'
    when 'Zentrales Mittelfeld'
      'Central Midfield'
    when 'Defensives Mittelfeld'
      'Defensive Midfield'
    when 'Rechtes Mittelfeld'
      'Right Midfield'
    when 'Linkes Mittelfeld'
      'Left Midfield'
    when 'Linksau&szlig;en'
      'Left Wing'
    when 'Mittelst&uuml;rmer'
      'Centre Forward'
    else
      pos
    end
  end

  def self.translate_nationality(nat)
    case nat
    when 'Australien'
      'Australia'
    when 'Elfenbeinküste'
      'Ivory Coast'
    when 'Cote d\'Ivoire'
      'Ivory Coast'
    when 'Frankreich'
      'France'
    when 'Irland'
      'Ireland'
    when 'Norwegen'
      'Norway'
    when 'Polen'
      'Poland'
    when 'Schottland'
      'Scotland'
    when 'Südafrika'
      'South Africa'
    else
      nat
    end
  end

  def self.parse_money(money)
    r = CURRENCY_REGEX.match(money)
    if r
      [r[1].gsub(/,/, '').to_i, r[2]]
    else
      [0, '€']
    end
  end
end
