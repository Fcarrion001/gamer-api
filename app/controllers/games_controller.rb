# frozen_string_literal: true
require 'http'

class GamesController < OpenReadController
  before_action :set_game, only: [:show]
  # GET /games
  def gameapi
    # user_key given by 3rd party api
    user_key = ENV['USER_KEY']
    p user_key
    p "route is being hit"
    # headers and get request required by the api in the format that the gem requires
    response = HTTP.headers({ :accept => "application/json", 'user-key' => user_key })
                .get("https://api-2445582011268.apicast.io/games/?fields=name,release_dates.human,release_dates.platform&filter[release_dates.platform][eq]=48&filter[release_dates.platform][eq]=6&filter[release_dates.platform][eq]=49&filter[release_dates.human][gt]=2017-Aug-30&filter[popularity][gt]=80&filter[category][eq]=0").to_s
      render json: response
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
  # def create
  #   @game = Game.new(game_params)
  #
  #   if @game.save
  #     render json: @game, status: :created, location: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end
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
    params.require(:game).permit(:game_name, :platform, :release_date)
  end
end
