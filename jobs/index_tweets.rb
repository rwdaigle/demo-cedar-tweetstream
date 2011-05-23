class IndexTweet

  @queue = :normal

  def self.perform(tweet)
    puts "Indexing: #{tweet}"
  end

end
