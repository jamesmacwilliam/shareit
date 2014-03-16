require 'spec_helper'

describe Tag do
  describe '#as_json' do
    it 'has correct attributes' do
      expect(create(:tag).as_json.keys).to eq %i(id name created_at updated_at)
    end
  end
end
