require "rubygems"
require "bundler/setup"

require "pusher"
require "tweetstream"
require "resque"
require 'resque/tasks'

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Pusher.app_id = "ryan-test-heroku-tweetstream"

STDOUT.sync = true


task "tweetstream:stream" do
  TweetStream::Client.new(ENV["TWITTER_USERNAME"], ENV["TWITTER_PASSWORD"]).track(ENV["TWITTER_KEYWORD"]) do |status|
    Resque.enqueue(IndexTweet, status)
    Pusher['tweets'].trigger('tweet', status)
  end
end

task "resque:setup"
