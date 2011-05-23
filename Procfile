web: bundle exec thin start -p $PORT -e $RACK_ENV
stream: bundle exec rake tweetstream:stream --trace
worker: bundle exec rake resque:work QUEUE=normal VERBOSE=1 --trace
clock: bundle exec clockwork clock.rb
