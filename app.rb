require "sinatra/base"
require "uri"

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

  end
end
