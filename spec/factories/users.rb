FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    uid { Faker::Number.number(digits: 10) }
    avatar_url { Faker::Avatar.image }
  end
end
