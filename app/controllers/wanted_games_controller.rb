class WantedGamesController < OpenReadController
  before_action :set_wanted_game, only: [:update, :destroy]

  # GET /wanted_games
  def index
    @wanted_games = current_user.wanted_games.all
    # @wanted_games = WantedGame.all
    render json: @wanted_games
  end

  # GET /wanted_games/1
  def show
    @wanted_game = WantedGame.find(params[:id])
    render json: @wanted_game
  end

  # POST /wanted_games
  def create
    @wanted_game = current_user.wanted_games.build(wanted_game_params)

    if @wanted_game.save
      render json: @wanted_game, status: :created, location: @wanted_game
    else
      render json: @wanted_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wanted_games/1
  def update
    if @wanted_game.update(wanted_game_params)
      render json: @wanted_game
    else
      render json: @wanted_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wanted_games/1
  def destroy
    @wanted_game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted_game
      @wanted_game = current_user.wanted_games.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wanted_game_params
      params.require(:wanted_game).permit(:user_id, :game_id)
    end
end
