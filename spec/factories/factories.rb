FactoryGirl.define do
  sequence :email do |n|
    "johndoe#{n}@example.com"
  end

  sequence :lorem do |n|
    "#{Faker::Lorem.words.first}#{n}"
  end

  sequence :name do |n|
    "#{Faker::Name.last_name}#{n}"
  end

  sequence :incrementing_name do |n|
    "John #{n}"
  end

  factory :user do
    name
    email
    password '12345678'
    password_confirmation '12345678'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end

  factory :address do
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip_code }
    country { Faker::Address.country }
    user
    default false

    trait :default do
      default true
    end
  end

  factory :geography do
    before(:create) do |geography|
      addrs = create_list(:address, 2, user: create(:user))
      geography.start_address = addrs.first
      geography.end_address = addrs.last
    end
    miles_to_travel { (0..1000).to_a.sample.to_s }
    willing_to_travel_across_state_line { [true, false].sample }
    state_line_fee { (0..300).to_a.sample.to_s }
  end

  factory :tag do
    name { generate(:lorem) }
  end

  factory :tag_interest do
    ignore do
      tags []
      tags_count 1
      no_tags false
      listings_count 0
    end

    after(:create) do |tag_interest, evaluator|
      unless evaluator.no_tags
        tag_interest.tag_ids = (!evaluator.tags.empty? ? evaluator.tags :
          create_list(:tag, evaluator.tags_count)).map(&:id)
      end
      evaluator.listings_count.times do
        tag = create(:tag)
        create(:listing, tags: [tag])
        tag_interest.tag_ids << tag.id
      end
      tag_interest.save
    end

    user
    default false

    trait :default do
      default true
    end
  end

  factory :listing do
    before(:create) do |listing|
      geo = create(:geography)
      listing.user = geo.user
      listing.geography = geo
    end

    ignore do
      tags []
      tags_count 1
      no_tags false
    end

    after(:create) do |listing, evaluator|
      unless evaluator.no_tags
        listing.tags = !evaluator.tags.empty? ? evaluator.tags :
          create_list(:tag, evaluator.tags_count)
        listing.save
      end
    end

    listing_start 1.day.ago
    listing_end 1.day.from_now
    photos do
      Random.rand(10).times.map do
        Faker::Internet.url(Faker::Internet.domain_name, "/#{generate(:lorem)}.#{%w(jpg png gif).sample}")
      end
    end
    rate { (0..150).to_a.sample.to_s }
    #rate types should match Listing::RATE_TYPE
    rate_type { %w(hour minute mile fixed).sample }
    deposit { (0..1000).to_a.sample.to_s }
  end
end
