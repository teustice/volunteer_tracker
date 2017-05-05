require 'helper_spec'

describe 'Project' do
  describe '.all' do
    it 'Will return an empty array for the all method' do
      expect(Project.all).to eq []
    end
  end
end
