class CardsController < ApplicationController
    before_action :if_not_logged_in_redirect
   
    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @cards = @user.cards
      else
        @cards = Card.includes(:user)
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

    def show
        @card = Card.find_by_id(params[:id])
        redirect_to cards_path if !@card
    end


    private

    def card_params
        params.require(:card).permit(:player_name, :team_name, :year, :image)
    end
end
