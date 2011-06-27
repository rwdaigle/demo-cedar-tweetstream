require "rubygems"
require "bundler/setup"

require "tweetstream"
require "resque"
require "resque/tasks"

require File.dirname(__FILE__) + "/jobs/push_tweet"
require File.dirname(__FILE__) + "/jobs/persist_tweet"

STDOUT.sync = true

task "tweetstream:stream" => "queue:environment" do
  TweetStream::Client.new(ENV["TWITTER_USERNAME"], ENV["TWITTER_PASSWORD"]).track(ENV["TWITTER_KEYWORD"]) do |status|
    puts "Received tweet: #{status[:text]}"
    Resque.enqueue(PushTweet, status)
    Resque.enqueue(PersistTweet, status)
  end
end

namespace :queue do

  task :environment do
    require File.dirname(__FILE__) + "/config/resque"
  end

  task :clear do
    [:push, :persist].each do |name|
      Resque.redis.del "queue:#{name}"
    end
  end
end

namespace :resque do

  task :setup => "queue:environment" do
    Resque.after_fork do |job|
      if job.payload_class == PersistTweet
        require File.dirname(__FILE__) + "/config/active_record"
      end
    end
  end
end

namespace :db do

  task :environment do
    load 'config/active_record.rb'
  end

  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end
