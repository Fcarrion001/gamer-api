class WantedGameSerializer < ActiveModel::Serializer
  attributes :id, :game
  has_one :user_id
  has_one :game_id

def game
  object.game
end
end
