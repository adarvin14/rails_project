class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories.sort_by do |category| 
            #binding.pry
            category.games.count
        end
        @categories = @categories.reverse.uniq
    end

    def show
        @categories = current_user.categories.find_by(id: params[:id])
        render :show
    end 

    def new
        @category = current_user.categories.new(id: params[:id])
        @game = @category.games.build
    end

    def create
        @category = current_user.categories.build(category_params)
        
        if @category.save
            redirect_to category_path(@category)
        else
            render :new 
        end 
    end

    def edit 
        @category = current_user.categories.find_by(id: params[:id])
    end 

    def update
        @category = current_user.categories.update(category_params)

        if @category
            redirect_to category_path
        else 
            render :edit
        end 
    end 

    def delete
        @category = current_user.categories.find_by(id: params[:id])
        
        if @category
            @category.destroy 
        end 
        
        redirect_to categories
    end 


    private 

    def category_params
        params.require(:category).permit(:name, :user_id, :category_id)
    end 
end
