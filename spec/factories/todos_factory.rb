FactoryBot.define do
  factory :todo do
    user { :user }
    belonging { :belonging }
    status { "active" }
    user { :user }
  end
end
