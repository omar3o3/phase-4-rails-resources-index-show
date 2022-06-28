class BirdsController < ApplicationController

    def index
        render json: Bird.all
    end

    def show
        bird = Bird.find(params[:id])
        
        if bird
            render json: bird
        else 
            render json: {error: "Bird Not Found"}, status: :not_found
        end
    end

    def increment_likes
        bird = Bird.find(params[:id])
        
        if bird
            bird.update(likes: bird.likes + 1)
            render json: bird
        else 
            render json: {error: "Bird Not Found"}, status: :not_found
        end
    end




    private
    def bird_params
        params.permit(:names , :species ,  :likes)
    end

end
