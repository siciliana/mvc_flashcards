enable 'sessions'

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


#========== POST =========

post '/signup' do
	# create a new user and save to db 
	@user = User.create(params[:user])
	redirect '/profile'
end


post '/login' do
	# searches database for user info by email	
	# establish session through user_id
	@user = User.find_by_email(params[:user][:email])
	if @user

		# @card = Card.find(params[:card_id])
  # @deck = Deck.find(params[:deck_id])
  	# @round = Round.find(params[:id])
  	session[:user_id] = @user.id 
		# session[:deck_id] = @deck.id 
		redirect '/profile'
	else 
		session[:error] = "invalid login"
		redirect '/'
	end 
end 
