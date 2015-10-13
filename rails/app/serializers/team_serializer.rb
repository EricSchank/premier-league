class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :crest, :code, :value, :currency
  has_many :players
  attribute :short_name, key: 'short-name'
end
