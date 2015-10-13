class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :birth, :value, :currency, :nationality, :contract
  attribute :jersey_number, :key => 'jersey-number'
  belongs_to :team
end
