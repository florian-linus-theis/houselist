FactoryBot.define do
  factory :tenant do
    user { User.last }
    flat { Flat.last }
  end
end
