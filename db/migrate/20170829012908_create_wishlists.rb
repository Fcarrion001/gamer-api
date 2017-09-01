class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.string :game_name
      t.string :platform
      t.date :release_date

      t.timestamps
    end
  end
end
