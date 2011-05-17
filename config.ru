require "rubygems"
require "bundler/setup"

require "sinatra"
require "uri"
require "newrelic_rpm"

get "/" do
  erb :index
end

helpers do
  def pusher_api_key
    URI.parse(ENV["PUSHER_URL"]).user
  end
end

run Sinatra::Application

