class TournamentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tournaments = current_user.tounaments 
    end

    def show
        @tournaments = Tournaments.find_by(id: params[:id])
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

    def tournament_params
        params.require(:tournament).permit(:name, :user_id, :tournament_id)
    end 
end
