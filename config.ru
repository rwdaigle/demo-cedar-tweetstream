require "rubygems"
require "bundler/setup"
require "resque"
require "resque/server"

require File.dirname(__FILE__) + "/app"
require File.dirname(__FILE__) + "/config/resque"

run Rack::URLMap.new \
  "/"       => TweetStream::App.new,
  "/resque" => Resque::Server.new

