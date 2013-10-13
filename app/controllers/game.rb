enable 'sessions'

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: current_user, deck_id: params[:deck_id])
  @cards = @deck.cards
  @card = @deck.cards.first
  session[:round_id] = @round.id
  session[:card_id] = @card.id 

  p "we have established round!"
  # load_existing_round_on_this_deck(params[:deck_id])
  #   p "We are actually loading an existing round!"
  #   session[:round_id] = @existing_round.id 
  #   session[:card_id] = @round.current_card
 
  redirect "/round/#{@round.id}/deck/#{@deck.id}/card/#{@card.id}"
end

get '/round/:round_id/deck/:deck_id/card/:card_id' do
  @card = Card.find(params[:card_id])
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  session[:round_id] = @round.id
  session[:card_id] = @card.id 
  session[:deck_id] = @deck.id
  #putting logic here to validate answer 
  @real_answer = Card.find(params[:card_id]).answer.downcase
  @card.id.next
  @answer = params[:answer]

  erb :card_show
end

get '/round_results/:round_id/deck/:deck_id' do
  @user = current_user
  @round = Round.find(params[:round_id])
  erb :round_result
end

#========== POST =========

post '/round/:round_id/deck/:deck_id/card/:card_id' do
  @card = Card.find(params[:card_id])
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  session[:round_id] = @round.id
  session[:card_id] = @card.id
  session[:deck_id] = @deck.id

  @real_answer = Card.find(params[:card_id]).answer.downcase
  @next_card = @card
  @answer = params[:answer]

   if params[:user_input].downcase == @real_answer
       @round.score += 1
   end
   @next_route = get_next_card_route(@card, @round, @deck)
   p @next_route
   redirect @next_route
   @round.save
   
end 
