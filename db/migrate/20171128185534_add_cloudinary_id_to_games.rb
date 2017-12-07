class AddCloudinaryIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :cloudinary_id, :string
  end
end
