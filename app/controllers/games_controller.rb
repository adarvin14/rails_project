class GamesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
       if params[:category_id]
        @games = Category.find(params[:category_id]).games 
       else
        @games = current_user.games
       end
    end

    def show
    
    end

    def new
        @game = Game.new(category_id: params[:category_id])
    end

    def edit

    end

    def create
        @game = current_user.games.build(game_params)
        if @game.save
            redirect_to @game
        else
            render :new
        end
    end

    def update
        if @game.update(game_params)
            redirect_to @game
        else
            render :edit 
        end
    end

    def destroy
        @game.destroy 
        redirect_to games_path
    end

    private

    def game_params 
        params.require(:game).permit(:title, :release_year, :hours_played, :online_multiplayer, :campaign, :campaign_completed, :user_id, :category_id, category_attributes: [ :name ])
    end
end
