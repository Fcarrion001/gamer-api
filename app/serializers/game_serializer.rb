class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_name, :platform, :release_date, :api_id, :totalAdds
end
