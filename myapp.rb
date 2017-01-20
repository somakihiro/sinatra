require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'haml'

require_relative 'models/comment'
require_relative 'models/user'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

# Commentのルーテイング
get '/' do
  @comments = Comment.order("id").all
  haml :comments_index
end

post '/create' do
  Comment.create({:body => params[:body]})
  redirect '/'
  haml :comments_index
end

post '/delete' do
  Comment.find(params[:id]).destroy
  redirect '/'
  haml :comments_index
end

# Userのルーティング
get '/new/user' do
  @user = User.new
  p @user
  haml :user_new
end

get '/users' do
  @users = User.all
  haml :user_index
end

post '/create/user' do
  p params[:name]
  p params[:email]
  p params[:password]
  User.create({:name => params[:name], :email => params[:email], :password => params[:password]})
  redirect '/users'
  haml :users
end
