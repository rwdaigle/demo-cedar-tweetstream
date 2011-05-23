require "rubygems"
require "bundler/setup"
require "resque"
require "resque/server"

require File.dirname(__FILE__) + "/app"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

run Rack::URLMap.new \
  "/"       => TweetStream::App.new,
  "/resque" => Resque::Server.new

