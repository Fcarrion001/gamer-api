class RemoveUserFromWishlists < ActiveRecord::Migration[5.0]
  def change
    remove_reference :wishlists, :user, foreign_key: true
  end
end
