get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/logout' do 
	:index
end 
#========== POST =========

post '/signup' do
	:profile
end

post '/login' do
	:profile
end 

post '/game/:game_id/:card_id' do
	:game_board
	:game_results 
end
