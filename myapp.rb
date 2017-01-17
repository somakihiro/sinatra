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
