require "rubygems"
require "bundler/setup"

require "sinatra"
require "uri"

configure :production do
  require "newrelic_rpm"
end

get "/" do
  erb :index
end

get "/bad" do
  raise "this is an error"
end

helpers do
  def pusher_api_key
    URI.parse(ENV["PUSHER_URL"]).user
  end
end

run Sinatra::Application

