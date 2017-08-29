class CreateWantedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :wanted_games do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
