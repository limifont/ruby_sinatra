require 'sinatra'
require 'sinatra/cookies'
require 'pry'
require 'babbler'



get '/' do
	buddy_name = cookies[:buddy]
	if buddy_name == 'alex'
		buddy_name == 'Bob'
	end
	`say -v #{cookies[:buddy]} Hi! My name is #{buddy_name}. What is your name?`
	erb :home
end

get '/pick-a-buddy/:name' do
	cookies[:buddy] = params[:name]
	redirect '/'
end




get '/menu' do
	@topics = {'Birthday': '/birthday',
				'School': '/school',
				'Behavior': '/behavior',
				'Basic Commands': '/basic',
				'RETURN TO MAIN MENU': '/'}
	erb :topics
end


get '/birthday' do
	@topics = {'What day is your birthday?': '/day',
				'What do you want for your birthday?': '/want',
				'How old are you?': '/old',
				'Basic Commands': '/basic',
				'BACK': '/menu'}
	erb :topics
end

get '/day' do
	system("say -v #{cookies[:buddy]} What day is your birthday")
	redirect '/birthday'
end

get '/want' do
	system("say -v #{cookies[:buddy]} What do you want for your birthday")
	redirect '/birthday'
end

get '/old' do
	`say -v #{cookies[:buddy]} how old are you`
	redirect '/birthday'
end

get '/school' do
	@topics = {'Did you have fun at school today?': '/fun',
				'What did you learn about?': '/learn',
				'Did you listen to your teacher?': '/listen',
				'Basic Commands': '/basic',
				'BACK': '/menu'}
	erb :topics
end

get '/fun' do
	`say -v #{cookies[:buddy]} did you have fun at school today`
	redirect '/school'
end

get '/learn' do
	`say -v #{cookies[:buddy]} what did you learn about`
	redirect '/school'
end

get '/listen' do
	`say -v #{cookies[:buddy]} did you listen to your teacher`
	redirect '/school'
end

get '/behavior' do
	@topics = {'Were you good today?': '/good',
				'Were you nice to every one you met today?': '/nice',
				'Did you listen to our parents?': '/parents',
				'Basic Commands': '/basic',
				'BACK': '/menu'}
	erb :topics
end

get '/good' do
	`say -v #{cookies[:buddy]} were you good today?`
	redirect '/behavior'
end

get '/nice' do
	`say -v #{cookies[:buddy]} where you nice to everyone you met today?`
	redirect '/behavior'
end

get '/parents' do
	`say -v #{cookies[:buddy]} did you listen to your parents?`
	redirect '/behavior'
end


get '/basic' do
	@topics = {'That is awesome!': '/awesome',
		 			'Way to go buddy!': '/buddy',
					'You are a crazy silly pants': '/silly',
					'BACK': '/menu'}
	erb :topics
end

get '/awesome' do
	`say -v #{cookies[:buddy]} that is awesome!`
	redirect '/basic'
end

get '/buddy' do
	`say -v #{cookies[:buddy]} way to go buddy!`
	redirect '/basic'
end

get '/silly' do
	`say -v #{cookies[:buddy]} You are a crazy silly pants!`
	redirect '/basic'
end


post '/' do
	@name = params[:name]
	`say -v #{cookies[:buddy]} hi #{@name}! What would you like to talk about?`
	redirect '/menu'
end

