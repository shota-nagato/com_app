FactoryBot.define do
  factory :entry do
    title { "タイトル" }
    url { "https://example.com/xxx" }
    published_at { Time.current }
    association :feed
  end
end
