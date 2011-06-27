load "config/active_record.rb"
load "config/index_tank.rb"

class Tweet < ActiveRecord::Base
#  after_create { |tweet| 
#    puts "Indexing #{tweet["text"]}"
#    $index.document(tweet.to_param).add(:text => tweet.text, :user => tweet.user)
#  }
end
