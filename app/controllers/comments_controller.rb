class CommentsController < ApplicationController
skip_before_action :authorized, only: [:index, :create]
    def index
        comments = Comment.all
        render json: comments
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment 
    end

    def create
        comment = current_user.comments.create(comment_params)
        

        if comment.valid?
            render json: comment, status: :created
        else
            render json:comment.errors.full_messages, status: :unprocessable_entity
        end
        
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :room_id)
    end
end
