web: bundle exec thin start -p $PORT -e $RACK_ENV
stream: bundle exec rake tweetstream:stream --trace
worker: QUEUE=normal VERBOSE=1 bundle exec rake resque:work --trace
clock: bundle exec clockwork clock.rb
