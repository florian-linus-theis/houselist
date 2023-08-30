FactoryBot.define do
  factory :flat do
    address { Faker::Address.full_address }
    user { User.last }
    name { "My Flat" }
  end
end
