require 'helper_spec'

describe 'Volunteer' do
  describe '.all' do
    it 'Will return an empty array for the all method' do
      expect(Volunteer.all).to eq []
    end
  end

  describe '.save' do
    it 'It will save a Volunteer to the volunteers table' do
      name = "Billy"
      volunteer_id = Volunteer.save(name)
      expect(Volunteer.all[0]["id"]).to eq volunteer_id
      expect(Volunteer.all[0]["name"]).to eq name
    end
  end

  describe '.find' do
    it 'returns a volunteer based on id' do
      name = "Billy"
      volunteer_id = Volunteer.save(name)
      expect(Volunteer.find(volunteer_id)["name"]).to eq name
    end
  end

  describe '.edit' do
    it 'updates a volunteer with new values' do
      name = "Billy"
      volunteer_id = Volunteer.save(name)
      Volunteer.edit(volunteer_id, "New name")
      expect(Volunteer.all[0]["name"]).to eq "New name"
    end
  end

  describe '.delete' do
    it 'deletes a volunteer' do
      name = "Billy"
      volunteer_id = Volunteer.save(name)
      Volunteer.delete(volunteer_id)
      expect(Volunteer.all).to eq []
    end
  end

  describe '.add_to_project' do
    it 'adds a volunteer to a project' do
      name = "Billy"
      volunteer_id = Volunteer.save(name)
      project_id = SecureRandom.uuid
      Volunteer.add_to_project(volunteer_id, project_id)
      expect(Volunteer.all[0]['project_id']).to eq project_id
    end
  end
end
