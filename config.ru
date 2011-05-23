require "rubygems"
require "bundler/setup"
require "resque/server"

require File.dirname(__FILE__) + "/app"

run Rack::URLMap.new \
  "/"       => TweetStream::App.new,
  "/resque" => Resque::Server.new

