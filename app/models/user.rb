# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :wanted_games
  has_many :games, through: :wanted_games
end
