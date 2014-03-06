# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
    user_id "MyString"
    default false
  end
end
