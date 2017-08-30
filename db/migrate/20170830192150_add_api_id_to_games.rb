class AddApiIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :api_id, :integer
    add_column :games, :totalAdds, :integer, default: 1
  end
end
