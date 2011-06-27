web:      bundle exec thin start -p $PORT -e $RACK_ENV
stream:   bundle exec rake tweetstream:stream --trace
push:     bundle exec rake resque:work QUEUE=push --trace
persist:  bundle exec rake resque:work QUEUE=persist --trace
clock:    bundle exec clockwork clock.rb
