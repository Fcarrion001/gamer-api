class RenameWishlistToGame < ActiveRecord::Migration[5.0]
  def change
    rename_table :wishlists, :games
  end
end
