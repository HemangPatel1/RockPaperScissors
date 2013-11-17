require 'sinatra/base'
require 'data_mapper'
require './lib/score'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/rps_#{env}")
#DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

DataMapper.finalize
DataMapper.auto_upgrade!


class RPS < Sinatra::Base
set :views, File.join(File.dirname(__FILE__), '..', 'views')

	get '/' do
	  @score = Score.last.winner
	  erb :index
	end

	post '/score' do
	  @winner = params[:winner]
	  Score.create(:winner => @winner) 
	  puts "#{@winner}"
	end

	get '/score_computer' do
	  Score.count(:winner.like => "Computer").to_s
	end

	get '/score_player' do
	  Score.count(:winner.like => "You").to_s
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
