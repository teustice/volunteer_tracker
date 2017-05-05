require 'helper_spec'

describe 'Project' do
  describe '.all' do
    it 'Will return an empty array for the all method' do
      expect(Project.all).to eq []
    end
  end

  describe '.save' do
    it 'It will save a Project to the projects table' do
      name = "Litter clean up"
      description = "Clean up litter around Portland"
      project_id = Project.save(name, description)
      expect(Project.all[0]["id"]).to eq project_id
      expect(Project.all[0]["name"]).to eq name
      expect(Project.all[0]["description"]).to eq description
    end
  end
end
