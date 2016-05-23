require 'sinatra'
require 'pry'
require 'babbler'

get '/' do
	erb :home
end

get '/birthday' do
	@birthday_topics = {'What day is your birthday?': '/day', 'What do you want for your birthday?': '/present', 'BACK': '/menu'}
	erb :birthday
end



get '/menu' do
	@menu_options = {'Birthday': '/birthday',
	 				'School': '/school', 
	 				'Behavior': '/behavior'}

	 erb :menu
end

post '/' do
	@name = params[:name]
	`say hi #{@name}, my name is bob. what would you like to talk about`
	redirect '/menu'
end

get '/day' do
	`say What day is your birthday`
	redirect '/birthday'
end

get '/present' do
	`say What do you want for your birthday`
	redirect '/birthday'
end

