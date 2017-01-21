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
end

post '/delete' do
  Comment.find(params[:id]).destroy
  redirect '/'
end

# Userのルーティング
get '/new/user' do
  @user = User.new
  haml :user_new
end

get '/users' do
  @users = User.all
  haml :user_index
end

post '/create/user' do
  # TODO: バリデーションはもっと調べてからしっかり実装する
  if params[:name] == '' || params[:email] == '' || params[:password] == ''
    redirect '/new/user'
  end
  User.create({:name => params[:name], :email => params[:email], :password => params[:password]})
  redirect '/users'
end
