class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end
    
end
