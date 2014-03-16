require 'spec_helper'

describe Listing do
  let(:listing_with_one_tag) { create(:listing, tags: one_tag) }
  let(:listing_without_tags) { create(:listing, no_tags: true) }
  let(:two_tags) { create_list(:tag, 2) }
  let(:one_tag) { create_list(:tag, 1) }

  describe '#as_json' do
    it 'has correct attributes' do
      expect(listing_with_one_tag.as_json.keys).to eq(
        %i(id tags geography listing_start listing_end photos rate rate_type deposit created_at
          updated_at desc)
      )
    end
  end

  describe '#tag_ids' do
     it 'returns an empty array if empty' do
       expect(listing_without_tags.tag_ids).to be_empty
     end

     it 'returns tag_ids' do
       expect(listing_with_one_tag.tag_ids).to eq one_tag.map(&:id)
     end
  end

  describe '#tag_names' do
     it 'returns an empty array if empty' do
       expect(listing_without_tags.tag_names).to be_empty
     end

     it 'returns tag_names' do
       expect(listing_with_one_tag.tag_names).to eq one_tag.map(&:name)
     end
  end

  describe '#tag_ids=' do
    it 'clears associated tags if empty array' do
      listing_with_one_tag.tag_ids = []
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to be_empty
    end

    it 'clears associated tags if nil' do
      listing_with_one_tag.tag_ids = nil
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to be_empty
    end

    it 'sets associated tags' do
      listing_with_one_tag.tag_ids = two_tags.map(&:id)
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to eq two_tags
    end
  end

  describe '#tag_names=' do
    it 'clears associated tags if empty array' do
      listing_with_one_tag.tag_names = []
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to be_empty
    end

    it 'clears associated tags if nil' do
      listing_with_one_tag.tag_names = nil
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to be_empty
    end

    it 'sets associated tags' do
      listing_with_one_tag.tag_names = two_tags.map(&:name)
      listing_with_one_tag.reload
      expect(listing_with_one_tag.tags).to eq two_tags
    end

    it 'creates associated tags' do
      listing_with_one_tag
      expect {
        listing_with_one_tag.tag_names = (1..2).map {|n| "tag#{n}"}
      }.to change(Tag, :count).from(1).to(3)
    end
  end

  describe 'validations' do
    it 'raises an error if rate type is invalid' do
      expect { create(:listing, rate_type: 'foo') }.to raise_error
    end
  end
end
