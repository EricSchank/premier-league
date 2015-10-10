class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :crest, :code, :value, :currency
end
