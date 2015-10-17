class TeamFaveSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  belongs_to :team
  # belongs_to :user
end
