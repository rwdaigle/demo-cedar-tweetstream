require "sinatra/base"
require "uri"
require "newrelic_rpm"
require "hoptoad_notifier"

module TweetStream
  class App < Sinatra::Base

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

    # send errors to hoptoad
    enable :raise_errors
    HoptoadNotifier.configure do |config|
      config.api_key = ENV['HOPTOAD_API_KEY']
    end
    use HoptoadNotifier::Rack
  end
end
