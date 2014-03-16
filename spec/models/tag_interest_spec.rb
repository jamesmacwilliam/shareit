require 'spec_helper'

describe TagInterest do
  context '#as_json' do
    it 'has correct attributes' do
      expect(create(:tag_interest).as_json.keys).to eq %i(tags listings created_at updated_at default)
    end
  end

  context '#tags' do
    it 'returns tags if they exist' do
      expect(create(:tag_interest, tags_count: 1).tags.size).to eq 1
    end

    it 'returns an empty array if none found' do
      expect(create(:tag_interest, no_tags: true).tags).to be_empty
    end
  end

  context '#tags=' do
    let(:tag_interest) { create(:tag_interest, tags_count: 1) }

    it 'sets tags' do
      tag_interest.tags = create_list(:tag, 2)
      expect(tag_interest.tags.size).to eq 2
    end

    it 'empties tag_ids with empty array' do
      tag_interest.tags = []
      expect(tag_interest.tag_ids).to be_empty
    end

    it 'empties tag_ids with nil' do
      tag_interest.tags = nil
      expect(tag_interest.tag_ids).to be_empty
    end
  end

  context '#listings' do
    it 'returns relations if they exist' do
      expect(create(:tag_interest, listings_count: 1).listings.size).to eq 1
    end

    it 'returns an empty array if none found' do
      expect(create(:tag_interest).listings.size).to eq 0
    end
  end
end
