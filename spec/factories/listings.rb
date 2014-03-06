# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    listing_start 1.day.ago
    listing_end Time.now
    photos ["MyString"]
    rate "MyString"
    rate_type "MyString"
    deposit "MyString"
  end
end
