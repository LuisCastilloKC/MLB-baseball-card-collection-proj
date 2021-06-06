class CommentsController < ApplicationController
    before_action :if_not_logged_in_redirect
    before_action :set_comment, only: [:show, :edit, :update]
    before_action :redirect_if_not_authorized, only: [:edit, :update]
    
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
        @comment = Comment.new
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
        set_comment
    end

    def edit
        set_comment
        redirect_to comments_path if !@comment || @comment.user != current_user
    end

    def update
        set_comment
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end
    
    def comment_params
        params.require(:comment).permit(:content, :card_id)
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment 
            flash[:message] = "Comment was not found"
            redirect_to comments_path
        end
    end

    def redirect_if_not_authorized
        redirect_to comments_path if @comment.user != current_user
    end

end
