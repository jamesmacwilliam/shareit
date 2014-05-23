require 'factory_girl_rails'
#require './spec/factories/factories'


user = FactoryGirl.create(:user)

puts "username: #{user.email} pw: #{user.password}"

10.times do |n|
  FactoryGirl.create(:tag_interest, listings_count: (n*2), user: user)
end

FactoryGirl.create_list(:listing, 15, tags_count: 4, user: user)
