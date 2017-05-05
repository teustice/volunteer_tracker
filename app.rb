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

# ADD PROJECT --------------------------
get '/add_project' do
  erb(:add_project)
end

post '/add_project' do
  name = params.fetch('name')
  description = params.fetch('description')
  Project.save(name, description)
  redirect('/')
end


# PROJECT PAGE --------------------------
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

# UPDATE PROJECT --------------------------
get '/project/:id/update_project' do
  @project = Project.find(params.fetch('id'))
  erb(:update_project)
end

patch '/project/:id/update_project' do
  id = params.fetch('id')
  name = params.fetch('name')
  description = params.fetch('description')
  Project.edit(id, name, description)
  redirect("/project/#{id}")
end

# DELETE PROJECT
delete '/project/:id/delete' do
  id = params.fetch('id')
  Project.delete(id)
  redirect('/')
end

# ADD VOLUNTEER --------------------------
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

# VOLUNTEER EDIT PAGE --------------------------
get '/project/:project_id/volunteer/:volunteer_id' do
  @project_id = params.fetch('project_id')
  @volunteer = Volunteer.find(params.fetch('volunteer_id'))
  erb(:volunteer)
end

patch '/project/:project_id/volunteer/:volunteer_id' do
  project_id = params.fetch('project_id')
  volunteer = Volunteer.find(params.fetch('volunteer_id'))
  name = params.fetch('name')
  Volunteer.edit(volunteer['id'], name)
  redirect("/project/#{project_id}")
end

delete '/project/:project_id/volunteer/:volunteer_id/delete' do
  volunteer_id = params.fetch('volunteer_id')
  project_id = params.fetch('project_id')
  Volunteer.delete(volunteer_id)
  redirect("/project/#{project_id}")
end
