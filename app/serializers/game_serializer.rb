class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_name, :platform, :release_date, :api_id, :totalAdds,
             :storyline, :summary, :url, :screenshot, :cloudinary_id
end
