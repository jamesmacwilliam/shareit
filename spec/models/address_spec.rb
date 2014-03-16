require 'spec_helper'

describe Address do
  describe '#as_json' do
    it 'returns correct attributes' do
      expect(create(:address).as_json.keys).to eq(
        %i(id street city state zip country default created_at updated_at)
      )
    end
  end
end
