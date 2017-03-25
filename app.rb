# require 'bundler'
# Bundler.require
#require 'bundler/setup'
require 'rubygems'
require 'sinatra'
require './models/idea'
# require 'mongo'



class IdeaBoxApp < Sinatra::Base



configure do

  enable :sessions
  # set :session_secret, "secret"
  # set :method_override, true
  set :username, "frank"
  set :password, "sinatra"

end



  # enable: sessions
  # enable: logging


	not_found do
		erb :error
	end




	get '/' do
    halt(401,'Not Authorized') unless session[:admin] = 4
    # halt(401,'Not Authorized') unless session[:admin] can't be a boolean???
		erb :index, locals: {ideas: Idea.all}
    # This means render the ERB template named index and define in
    # that scope the local variable named ideas with the value [].
  end


  #how to change so 1 url for new idea, 1 url for new user
  #post '/cast' do | should i moved this to idea.rb
  post '/idea' do
   # params.inspect
    #make a new idea
    idea = Idea.new(params['idea_title'], params['idea_description'])
    idea.save
    redirect '/'
  end


  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end

  get '/:id/edit' do |id|

    erb :edit, locals: {id: id}
  end





  get '/hello' do
    # greeting = params[:greeting] || "Hi There"
    # erb :index, locals => {'greeting' => greeting}
 puts "hello world"

  end


  get '/login' do
    erb :login
  end



  post '/login' do
    if params[:username] == settings.username && params[:password] == settings.password
      session[:admin] == 4

     # p session[:admin]

      redirect '/'
    else
      erb :login
    end
  end

get '/logout' do
  session.clear
  redirect '/login'

end


end

