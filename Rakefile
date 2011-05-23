require "rubygems"
require "bundler/setup"

require "pusher"
require "tweetstream"

STDOUT.sync = true

task "tweetstream:stream" do
  Pusher.app_id =
  TweetStream::Client.new(ENV["TWITTER_USERNAME"], ENV["TWITTER_PASSWORD"]).track(ENV["TWITTER_KEYWORD"]) do |status|
    puts "%s: %s" % [ status[:user][:screen_name], status[:text] ]
    Pusher['tweets'].trigger('tweet', status)
  end
end
