class AddUrlToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :url, :string
  end
end
