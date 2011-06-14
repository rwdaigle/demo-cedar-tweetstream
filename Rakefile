require "rubygems"
require "bundler/setup"

require "pusher"
require "tweetstream"
require "resque"
require 'resque/tasks'

require File.dirname(__FILE__) + "/jobs/index_tweet"
require File.dirname(__FILE__) + "/config/resque"

STDOUT.sync = true

task "tweetstream:stream" do
  TweetStream::Client.new(ENV["TWITTER_USERNAME"], ENV["TWITTER_PASSWORD"]).track(ENV["TWITTER_KEYWORD"]) do |status|
    puts "Processing tweet: #{status[:text]}"
    Resque.enqueue(IndexTweet, status[:user][:screen_name], status[:text])
    Pusher['tweets'].trigger('tweet', status)
  end
end

task "tweetstream:queue:clear" do
  Resque.redis.del "queue:normal"
end
