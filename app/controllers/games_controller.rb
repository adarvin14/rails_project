class GamesController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:category_id]
            @category = current_user.categories.find_by(id: params[:category_id])
            @games = @category.games
        elsif params[:search_term]
            if params[:search_term] = "multiplayergames"
                @games = current_user.games.multiplayergames
            # else params[:search_term] = "awesomegames"
            #     @games = current_user.games.awesomegames
            end
        else
            @games = current_user.games.order(:title)
        end
    end

    def show
        @game = current_user.games.find_by(id: params[:id])
        if !@game
            redirect_to games_path
        end
    end

    def new
        if params[:category_id] && @category = current_user.categories.find_by(id: params[:category_id])
            @game = @category.games.build
        else
            @game = current_user.games.build
        end
    end

    def edit
        @game = current_user.games.find_by(id: params[:id])
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
        @game = current_user.games.find_by(id: params[:id])
        if @game.update(game_params)
            redirect_to @game
        else
            render :edit 
        end
    end

    def destroy
        @game = current_user.games.find_by(id: params[:id])
        if @game
            @game.destroy 
        end
        redirect_to games_path
    end

    private

    def game_params 
        params.require(:game).permit(:title, :release_year, :hours_played, :online_multiplayer, :campaign, :campaign_completed, :user_id, :category_id, category_attributes: [ :name ])
    end
end
