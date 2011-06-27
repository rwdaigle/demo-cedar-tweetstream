require File.dirname(__FILE__) + "/../config/resque"

class PushTweet

  @queue = :push

  def self.perform(tweet)
    puts "Pushing tweet to client: #{tweet["text"]}"
    Pusher['tweets'].trigger('tweet', tweet["text"])
  end

end
