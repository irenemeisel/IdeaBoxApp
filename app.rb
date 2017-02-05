# require 'bundler'
# Bundler.require
#require 'bundler/setup'
require 'sinatra'
require './idea'



class IdeaBoxApp < Sinatra::Base
  set :method_override, true


	not_found do
		erb :error
	end


	get '/' do
		# "hello world"
		erb :index, locals: {ideas: Idea.all}
  end


  post '/' do
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

  get '/hello/' do
    greeting = params[:greeting] || "Hi There"
    erb :index, locals:  {greeting: greeting}
  end


end



