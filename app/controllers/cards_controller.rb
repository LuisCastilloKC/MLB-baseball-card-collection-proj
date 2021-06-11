class CardsController < ApplicationController
    before_action :if_not_logged_in_redirect
   
    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        if @user == current_user
        @cards = @user.cards.most_comments 
      else
        flash[:message] = "You are Not Authorize to this page"
        redirect_to user_cards_path(current_user)
        end
    else
        @cards = Card.most_comments 
      end
    end
    
    def new 
        @card = Card.new
    end
    

    def create
       @card = current_user.cards.build(card_params)
        if @card.save
            redirect_to cards_path
        else
            render :new
        end
    end

    def edit
        @card = Card.find_by_id(params[:id])
        redirect_to cards_path if !@card || @card.user  != current_user
    end

    def update
        @card = Card.find_by(id: params[:id])
        redirect_to cards_path  if !@card || @card.user != current_user
        if @card.update(card_params)
            redirect_to card_path(@card)
        else
            render :edit
        end
    end

    def show
        @card = Card.find_by_id(params[:id])
        redirect_to cards_path if !@card
    end

    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        redirect_to cards_path
    end

    def most_commented
        @most_commented_card = Card.most_comments
    end

    private

    def card_params
        params.require(:card).permit(:player_name, :team_name, :year, :image)
    end
end
