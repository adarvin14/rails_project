class GamesController < ApplicationController
    def index
        @game = current_user.games 
    end

    def show
        @game = Games.find_by(id: params[:id])
        render :show
    end 

    def new
    end

    def create
    end

    def edit 
    end 

    def update
    end 

    def delete
    end 


    private 

    def game_params
        params.require(:game).permit(:title, :user_id, :tournament_id)
    end 
end
