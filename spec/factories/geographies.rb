# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :geography do
    start_address_id "MyString"
    end_address_id "MyString"
    miles_to_travel "MyString"
    willing_to_travel_across_state_line false
    state_line_fee "MyString"
  end
end
