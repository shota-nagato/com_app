FactoryBot.define do
  factory :entry do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:url) { |n| "https://example.com/#{n}" }
    published_at { Time.current }
    association :feed
  end
end
