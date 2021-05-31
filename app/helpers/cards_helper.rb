module CardsHelper
    def display_index_helper
        if @user 
           content_tag(:h1, "#{@user.username}'s Cards:")
        else
            content_tag(:h2, "All Cards")
        end  
    end
end
