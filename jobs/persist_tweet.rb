require File.dirname(__FILE__) + "/../models/tweet"

class PersistTweet

  @queue = :persist

  def self.perform(tweet)
    puts "Persisting: #{tweet["text"]}"
    Tweet.create!(:user => tweet["username"], :text => tweet["text"])
  end

end
