require File.dirname(__FILE__) + "/../config/resque"
require File.dirname(__FILE__) + "/../models/tweet"

class PersistTweet

  @queue = :persist

  def self.perform(tweet)
    puts "Saving tweet: #{tweet["text"]}"
    Tweet.create!(:user => tweet["username"], :text => tweet["text"])
  end

end
