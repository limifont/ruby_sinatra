require 'sinatra'
require 'pry'
require 'babbler'

get '/' do
	erb :home
end

get '/birthday' do
	@birthday_topics = {'What day is your birthday?': '/day',
		 									'What do you want for your birthday?': '/want',
											'How old are you': '/old', 'Basic Commands': '/basic',
											'BACK': '/menu'}
	erb :birthday
end

get '/day' do
	`say What day is your birthday`
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
	@school_topics = {'Did you have fun at school today?': '/fun',
		 								'What did you learn about?': '/learn',
										'Did you listen to your teacher': '/listen',
										'Basic Commands': '/basic', 'BACK': '/menu'}
	erb :school
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
	@behav_topics = {'Were you good today?': '/good',
		 								'Were you nice to every one you met today?': '/nice',
										'Did you listen to our parents?': '/parents',
										'Basic Commands': '/basic', 'BACK': '/menu'}
	erb :behavior
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

get '/basic' do
	@basic_topics = {'That is awesome!': '/awesome',
		 								'Way to go buddy!': '/buddy',
										'You are a crazy silly pants': '/silly',
										'BACK': '/menu'}
	erb :basic
end

get '/awesome' do
	`say that is awesome!`
	redirect '/basic'
end

get '/buddy' do
	`say way to go buddy!`
	redirect '/basic'
end

get '/silly' do
	`say You are a crazy silly pants!`
	redirect '/basic'
end


get '/menu' do
	@menu_options = {'Birthday': '/birthday',
									'School': '/school',
									'Behavior': '/behavior',
									'Basic Commands': '/basic'}
		erb :menu
end

post '/' do
	@name = params[:name]
	`say hi #{@name}, my name is bob. what would you like to talk about`
	redirect '/menu'
end
