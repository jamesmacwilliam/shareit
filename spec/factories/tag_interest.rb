# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag_interest, :class => 'TagInterests' do
    tag_ids ["MyString"]
    user_id "MyString"
    geography_id "MyString"
    default false
  end
end
