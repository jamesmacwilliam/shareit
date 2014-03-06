# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :usage do
    listing_id "MyString"
    units "MyString"
    user_id "MyString"
    completed false
    paid false
  end
end
