class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :crest, :code, :value, :currency
  has_many :players
  has_many :team_faves, key: 'team-faves'
  attribute :short_name, key: 'short-name'
end
