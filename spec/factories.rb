FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { 'landlord' }
  end

  factory :flat do
    address { Faker::Address.full_address }
    user
    name { "My Flat" }
  end

  factory :todo do
    belonging
    status { "active" }
    description { "MyText" }
    user
  end

  factory :tenant do
    user
    flat
  end

  factory :notification do
    user
    todo
    belonging
    description { "MyText" }
    read { false }
  end

  factory :category do
    name { "MyString" }
  end

  factory :belonging do
    name { "MyString" }
    status { "damaged" }
    description { "MyText" }
    flat
    category
  end
end
