require 'sinatra'

get '/' do
  'Hello world!'
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
