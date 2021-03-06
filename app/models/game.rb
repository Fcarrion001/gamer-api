# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :wanted_games
  has_many :users, through: :wanted_games
  validates :platform, uniqueness: { scope: :api_id }
end
