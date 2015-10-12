class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :jersey_number, :birth, :value, :currency, :nationality, :contract
end
