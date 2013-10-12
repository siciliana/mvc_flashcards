helpers do 

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end 
  end 

  def logged_in?
    !current_user.nil? 
  end

  def current_round
    if session[:round_id]
      @current_round ||= Round.find(session[:round_id])
    end 
  end

  def load_existing_game_on_this_deck(deck_id)
    puts "in load_existing_game_on_this_deck"
    puts "deck_id: #{deck_id}" 
    @existing_round = current_user.rounds.where("deck_id = #{deck_id}").first
    puts @existing_round
    @existing_round

  end 

  def current_round_card
    if session[:card_id]
      @current_card ||= Card.find(session[:card_id])
    end 
  end 

  def get_next_card(card)
    # is there another card after this?
    nil
    #if there isn't a card, redirect to results.

    #else if there is another card, return the next route.
  end

  def get_next_card_route(card_id, round_id, deck_id)

    @next_card = get_next_card(card_id)
    #if card is null, redirect to results
    if @next_card == nil
      @current_round = current_round
      redirect "/round_results/#{round_id.id}/deck/#{deck_id.id}/card/#{card_id.id}"
    else
      @next_card_id = @next_card.id
      @next_route = '/round_results/#{round_id.id}/deck/#{deck_id.id}/card/#{next_card_id.id}'
      redirect @next_route
    end
    #else return next route
  end



end 
