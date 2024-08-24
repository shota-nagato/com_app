FactoryBot.define do
  factory :user do
    name { "テスト太郎" }
    sequence(:email) { |n| "user#{n}@example.com" }
    confirmed_at { Time.current }
    password { "password" }
  end
end
