class CardsController < ApplicationController
    before_action :if_not_logged_in_redirect

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


    private

    def card_params
        params.require(:card).permit(:player_name, :team_name, :year)
    end
end
