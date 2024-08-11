FactoryBot.define do
  factory :feed do
    title { "タイトル" }
    url { "https://example.com/xxx/feed" }
    association :user
  end
end
