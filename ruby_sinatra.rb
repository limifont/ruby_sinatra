require 'sinatra'
require 'pry'
require 'babbler'

get '/' do
	erb :home
end

post '/' do
	@name = params[:name]
end