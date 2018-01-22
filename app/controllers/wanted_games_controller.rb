class WantedGamesController < ProtectedController
  before_action :set_wanted_game, only: [:update, :destroy]

  # GET /wanted_games
  def index
    # p 'this is WantedGame.where(user_id: options[:user].id ', WantedGame.where(user_id: )
    # @wanted_games = WantedGame.where(user_id: @current_user_id)
    # @wanted_games = WantedGame.joins(:wanted_games).where(wanted_games: { user_id: :user_id })
    @wanted_games = current_user.wanted_games.all
    # WantedGame.all
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
