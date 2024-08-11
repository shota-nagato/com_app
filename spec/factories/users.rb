FactoryBot.define do
  factory :user do
    name { "テスト太郎" }
    email { "user@example.com" }
    confirmed_at { Time.current }
    password { "password" }
  end
end
