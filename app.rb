require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pry'
require 'pg'
also_reload('lib/**/*.rb')

extend Project
extend Volunteer

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get '/' do
  @projects = Project.all
  erb(:index)
end

get '/add_project' do
  erb(:add_project)
end

post '/add_project' do
  name = params.fetch('name')
  description = params.fetch('description')
  Project.save(name, description)
  redirect('/')
end

get '/add_volunteer' do
  erb(:add_volunteer)
end
