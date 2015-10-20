class StandingSerializer < ActiveModel::Serializer
  attributes :id, :position, :points, :goals
  attribute :played_games, key: 'played-games'
  attribute :goals_against, key: 'goals-against'
  attribute :goal_difference, key: 'goal-difference'
  belongs_to :team
end
