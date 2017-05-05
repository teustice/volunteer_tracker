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

# ADD PROJECT
get '/add_project' do
  erb(:add_project)
end

post '/add_project' do
  name = params.fetch('name')
  description = params.fetch('description')
  Project.save(name, description)
  redirect('/')
end


# PROJECT PAGE
get '/project/:id' do
  @project = Project.find(params.fetch('id'))
  @volunteers = []
  Volunteer.all.each do |volunteer|
    if volunteer['project_id'] == @project['id']
      @volunteers.push(volunteer)
    end
  end
  erb(:project)
end

get '/project/:id/add_volunteer' do
  @project = Project.find(params.fetch('id'))
  erb(:add_volunteer)
end

post '/project/:id/add_volunteer' do
  project_id = params.fetch('id')
  name = params.fetch('name')
  id = Volunteer.save(name)
  Volunteer.add_to_project(id, project_id)
  redirect("/project/#{project_id}")
end


# ADD VOLUNTEER
get '/add_volunteer' do
  erb(:add_volunteer)
end
