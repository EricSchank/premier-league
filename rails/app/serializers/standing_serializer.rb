class StandingSerializer < ActiveModel::Serializer
  attributes :id, :position, :points, :goals
  attribute :played_games, key: 'playedGames'
  attribute :goals_against, key: 'goalsAgainst'
  attribute :goal_difference, key: 'goalDifference'
  belongs_to :team
end
