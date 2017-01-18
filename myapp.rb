require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id desc").all
  haml :index
end
