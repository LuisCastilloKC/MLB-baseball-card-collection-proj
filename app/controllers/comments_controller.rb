class CommentsController < ApplicationController
    before_action :if_not_logged_in_redirect
    
    def index
        if params[:card_id] && @card = Card.find_by_id(params[:card_id])
            @comments = @card.comments
        else
            @error = "Card doesn't exist" if params[:card_id]
        @comments = Comment.all
        end
    end

    def new
        if params[:card_id] && @card = Card.find_by_id(params[:card_id])
            @comment = @card.comments.build
        else
            @error = "Card doesn't exist" if params[:card_id]
        @comments = Comment.new
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
       # @comment = Comment.find_by(id: params[:id])
        #if @comment.update(comment_params)
         #   redirect_to comment_path(@comment)
    end
    
end
