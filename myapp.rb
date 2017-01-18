require 'sinatra'
require 'sinatra/reloader'

before do
  @author = 'somakihiro'
end
helpers do
  def link(msg)
    "hello, #{msg}"
  end
end

get '/' do
  @title = 'main'
  @msg = link(@author)
  haml :index
end

# get '/hello/:name' do
#   "Hello #{params['name']}!"
# end

get '/hello/:name' do |n|
  "Hello #{n}"
end

get '/say/*/to/*' do
  params['splat']
end

get '/download/*.*' do
  params['splat']
end

get '/downloads/*.*' do |path, ext|
  [path, ext]
end

get %r{/hello/([\w]+)} do |c|
  "Hello, #{c}"
end

get 'posts.?:format?' do
  '"GET /posts" と "GET /posts.json", "GET /posts.xml" の拡張子などにマッチ'
end

get '/', :host_name => /^admin\./ do
  "Adminエリア"
end

get '/', :provides => 'html' do
  haml :index
end

get '/', :provides => ['rss', 'atom', 'xml'] do
  builder :feed
end
