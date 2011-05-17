require "rubygems"
require "bundler/setup"

require "sinatra"
require "uri"
require "hoptoad_notifier"

HoptoadNotifier.configure do |config|
  config.api_key = ENV['HOPTOAD_API_KEY']
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

