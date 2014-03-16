require 'spec_helper'

describe Geography do
  describe '#as_json' do
    let(:geography) { create(:geography) }
    it 'has correct attributes' do
      expect(geography.as_json.keys).to eq(
        %i(start_address end_address miles_to_travel willing_to_travel_across_state_line
          state_line_fee created_at updated_at)
      )
    end
  end
end
