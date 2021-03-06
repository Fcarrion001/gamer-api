require "rails_helper"

RSpec.describe WantedGamesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wanted_games").to route_to("wanted_games#index")
    end

    it "routes to #new" do
      expect(:get => "/wanted_games/new").to route_to("wanted_games#new")
    end

    it "routes to #show" do
      expect(:get => "/wanted_games/1").to route_to("wanted_games#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wanted_games/1/edit").to route_to("wanted_games#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wanted_games").to route_to("wanted_games#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/wanted_games/1").to route_to("wanted_games#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/wanted_games/1").to route_to("wanted_games#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wanted_games/1").to route_to("wanted_games#destroy", :id => "1")
    end

  end
end
