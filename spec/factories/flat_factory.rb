FactoryBot.define do
  factory :flat do
    address { Faker::Address.full_address }
    user
  end
end
