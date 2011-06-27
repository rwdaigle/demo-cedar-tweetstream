require 'active_record'
require 'logger'
require 'erb'

dbconfig = YAML.load(ERB.new(File.read('config/database.yml')).result)
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Migration.verbose = true
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV'] || 'development']
