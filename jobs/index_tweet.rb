class IndexTweet

  @queue = :normal

  def self.perform(username, status)
    puts "Indexing: #{status}"
  end

end
