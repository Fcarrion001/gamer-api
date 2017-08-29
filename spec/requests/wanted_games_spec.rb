require 'rails_helper'

RSpec.describe "WantedGames", type: :request do
  describe "GET /wanted_games" do
    it "works! (now write some real specs)" do
      get wanted_games_path
      expect(response).to have_http_status(200)
    end
  end
end
