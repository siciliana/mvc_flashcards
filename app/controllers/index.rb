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

post '/game/:game_id/:card_id' do
	# if game is not finished, continue iterating through cards and display game board view
	redirect '/game'
	# if game is finished, display game results view
	# :game_results 
end
