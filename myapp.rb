require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

class Comment < ActiveRecord::Base
end

comments = Comment.order("id").all
p comments

comments.each do |comment|
  p comment.id
  p comment.body
end

get '/' do
  @comments = Comment.order("id").all
  haml :index
end
