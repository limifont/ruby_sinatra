require 'sinatra'
require 'pry'
require 'babbler'

@buddy = 'victoria'


get '/' do
	erb :home
end




get '/menu' do
	@topics = {'Birthday': '/birthday',
				'School': '/school',
				'Behavior': '/behavior',
				'RETURN TO MAIN MENU': '/'}
	erb :topics
end


get '/birthday' do
	@topics = {'What day is your birthday?': '/day',
				'What do you want for your birthday?': '/want',
				'How old are you?': '/old',
				'BACK': '/menu'}
	erb :topics
end

get '/day' do
	`say -v ` + @buddy + `What day is your birthday`
	redirect '/birthday'
end

get '/want' do
	`say What do you want for your birthday`
	redirect '/birthday'
end

get '/old' do
	`say how old are you`
	redirect '/birthday'
end

get '/school' do
	@topics = {'Did you have fun at school today?': '/fun',
				'What did you learn about?': '/learn',
				'Did you listen to your teacher?': '/listen',
				'BACK': '/menu'}
	erb :topics
end

get '/fun' do
	`say did you have fun at school today`
	redirect '/school'
end

get '/learn' do
	`say what did you learn about`
	redirect '/school'
end

get '/listen' do
	`say did you listen to your teacher`
	redirect '/school'
end

get '/behavior' do
	@topics = {'Were you good today?': '/good',
				'Were you nice to every one you met today?': '/nice',
				'Did you listen to our parents?': '/parents',
				'BACK': '/menu'}
	erb :topics
end

get '/good' do
	`say were you good today?`
	redirect '/behavior'
end

get '/nice' do
	`say where you nice to everyone you met today?`
	redirect '/behavior'
end

get '/parents' do
	`say did you listen to your parents?`
	redirect '/behavior'
end


post '/' do
	@name = params[:name]
	`say hi #{@name}, my name is bob. what would you like to talk about`
	redirect '/menu'
end

