FactoryBot.define do
  factory :notification do
    user { :user }
    todo { :todo }
    belonging { :belonging }
    description { "MyText" }
    read { false }
  end
end
