require "rubygems"
require "bundler/setup"

require "pusher"
require "tweetstream"
require "resque"
require 'resque/tasks'

STDOUT.sync = true

Pusher.app_id = 5700

task "tweetstream:stream" do
  TweetStream::Client.new(ENV["TWITTER_USERNAME"], ENV["TWITTER_PASSWORD"]).track(ENV["TWITTER_KEYWORD"]) do |status|
    puts "Processing tweet: #{status[:text]}"
    Resque.enqueue(IndexTweet, status)
    Pusher['tweets'].trigger('tweet', status)
  end
end

task "resque:setup" do
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
