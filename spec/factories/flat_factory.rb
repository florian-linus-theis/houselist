FactoryBot.define do
  factory :flat do
    address { Faker::Address.full_address }
    user { :user }
    name { "My Flat" }
  end
end
