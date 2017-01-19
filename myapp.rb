require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'haml'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id").all
  haml :index
end

post '/create' do
  Comment.create({:body => params[:body]})
  redirect '/'
  haml :index
end

post '/delete' do
  Comment.find(params[:id]).destroy
  redirect '/'
  haml :index
end
