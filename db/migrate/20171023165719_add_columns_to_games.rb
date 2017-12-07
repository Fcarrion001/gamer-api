class AddColumnsToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :summary, :text
    add_column :games, :storyline, :text
    add_column :games, :screenshot, :string
  end
end
