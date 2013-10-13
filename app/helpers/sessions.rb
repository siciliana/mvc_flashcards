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
    else
      p "no current round found"
    end 
  end

  def current_deck
      if session[:deck_id]
      @current_deck ||= Deck.find(session[:deck_id])
    end 
  end


  def load_existing_round_on_this_deck(deck_id)
    puts "in load_existing_round_on_this_deck"
    puts "deck_id: #{deck_id}" 
    @existing_round = current_user.rounds.where("deck_id = #{deck_id}").first
    puts @existing_round
    @existing_round
  end 

  def current_round_card
    if session[:card_id]
      @current_card ||= Card.find(session[:card_id])
    else
      p "there is no current round card"
    end 
  end 

  def current_card_index
    @current_cards = current_round.deck.cards
    @current_index = @current_cards.find_by_id(current_round_card)
  end 

  def get_next_card(card)
    # is there another card after this?
    if current_card_index == -1 
      return nil 
     else
      p "********************************************"
      p current_card_index
      p "********************************************"

      @next_card_id = current_card_index.id + 1
      p @next_card_id;
      @next_honest_to_god_card = current_deck.cards.find(@next_card_id)
      return @next_honest_to_god_card
     end
    #if there isn't a card, redirect to results.

    #else if there is another card, return the next route.

    # temp_card = current_round.cards[current_round.cards.index(current_round_card)+1]
    # temp_card ? temp_card.id : nil 

  end

  def get_next_card_route(card_id, round_id, deck_id)

    @next_card = get_next_card(card_id)
    #if card is null, redirect to results
    @route_component = "/round_results/" + @round_id.to_s + "/deck/" + deck_id.to_s + "/"
    p @route_component
    if @next_card == nil
      @current_round = current_round
      redirect "/round_results/#{@round.id}/deck/#{@deck.id}"
    else
      @next_card_id = @next_card.id
      @next_route = "/round/#{@round.id}/deck/#{@deck.id}/card/#{@next_card_id}"
      redirect @next_route
    end
    #else return next route
  end

end 
