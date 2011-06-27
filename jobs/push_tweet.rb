require "pusher"
require File.dirname(__FILE__) + "/../config/resque"

class PushTweet

  @queue = :push

  def self.perform(tweet)
    puts "Broadcasting tweet: #{tweet["text"]}"
    Pusher['tweets'].trigger('tweet', tweet["text"])
  end

end
