require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
