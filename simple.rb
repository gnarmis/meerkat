require 'sinatra'
require 'net/http'

get '/hello' do
  return "Hello, World!"
end

get '/hello/:name/:age' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  return "Hello #{params[:name]}! You are #{params[:age]}!"
end


# a twitter 'client'
get '/tw/:name' do
  url = "http://twitter.com/statuses/user_timeline.json?id=#{params[:name]}"
  begin
   data = Net::HTTP.get_response(URI.parse(url)).body
   return data
  rescue
   return "Connection error."
  end
end
