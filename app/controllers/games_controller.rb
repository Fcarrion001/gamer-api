# frozen_string_literal: true
require 'http'
class GamesController < OpenReadController
  before_action :set_game, only: [:show]
  # GET /games
  def indexapi
    # user_key given by 3rd party api
    user_key = ENV['USER_KEY']
    p user_key
    p "route is being hit"
    p 'this is params', params[:id]
    p 'this is :params', :params
    # headers and get request required by the api in the format that the gem requires
    @games = HTTP.headers(:accept => 'application/json', 'user-key' => user_key)
              .get("https://api-2445582011268.apicast.io/games/?fields=name,first_release_date&filter[release_dates.platform][eq]=48&filter[popularity][gte]=8&filter[first_release_date][gte]=1504144194000&limit=50&scroll=1").to_s
              # binding.pry
              p @games
    render json: @games
  end

  def showapi
    user_key = ENV['USER_KEY']
    p 'this is params', params[:id]
      p 'this is :params', :params
    @game = HTTP.headers(:accept => 'application/json', 'user-key' => user_key)
              .get("https://api-2445582011268.apicast.io/games/#{params[:id]}?fields=name,first_release_date,storyline,summary,total_rating,genres,popularity&expand=genres&filter[summary][exists]=true").to_s

              render json: @game
end
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end
  #
  # # PATCH/PUT /games/1
  # def update
  #   if @game.update(game_params)
  #     render json: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /games/1
  # def destroy
  #   @game.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:game_name, :platform, :release_date, :api_id, :totalAdds)
  end
end
