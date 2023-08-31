FactoryBot.define do
  factory :belonging do
    name { "MyString" }
    status { "damaged" }
    description { "MyText" }
    flat { :flat }
    category { :category }
  end
end
