get '/' do
  erb :index
end

get '/logout' do 
	session.clear 
	redirect '/' 
end 

get '/profile' do 
	@user = current_user
	@decks = Deck.all 
	erb :profile 
end

get '/round/deck/:deck_id' do
	deck = Deck.find(params[:deck_id])
	p deck
	cards = deck.cards
	@card = cards.sample
	redirect "/round/deck/#{deck.id}/card/#{@card.id}"
end

get '/round/deck/:deck_id/card/:card_id' do
	card = Card.find(params[:card_id])
	render :card_show
end

#========== POST =========

post '/signup' do
	# create a new user and save to db 
	@user = User.create(params[:user])
	redirect '/'
end


post '/login' do
	# searches database for user info by email	
	# establish session through user_id
	@user = User.find_by_email(params[:user][:email])
	if @user
		session[:user_id] = @user.id 
		redirect '/profile'
	else 
		session[:error] = "invalid login"
		redirect '/'
	end 
end 

post '/round/:round_id/:card_id' do
	# if round is not finished, continue iterating through cards and display round board view
	# ----put scoring/iterating logic below ~Alex
	redirect '/round/deck/:deck_id'
	# if round is finished, display round results view
	# :game_results 
end

post '/checkanswer/:round_id/:id' do
  @round = Round.find_by_id(params[:round_id])
  @card = Card.find_by_id(params[:id])
  @real_answer = Card.find_by_id(params[:id]).answer.downcase
  @round.counter += 1
 if params[:answer].downcase == @real_answer
     @round.score += 1
     @round.save
   else
     @round.save
   end
end
