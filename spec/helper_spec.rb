require 'pry'
require 'rspec'
require 'pg'
require 'project'
require 'volunteer'
require 'securerandom'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end
end
