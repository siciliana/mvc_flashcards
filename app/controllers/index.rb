get '/' do
  erb :index
end

get '/logout' do 
	session.clear 
	redirect '/' 
end 
#========== POST =========

post '/signup' do
	# create a new user and save to db 

	:profile
end

post '/login' do
	# searches database for user info by email	
	# establish session through user_id
	:profile
end 

post '/game/:game_id/:card_id' do
	# if game is not finished, continue iterating through cards and display game board view
	erb :game
	# if game is finished, display game results view
	# :game_results 
end
