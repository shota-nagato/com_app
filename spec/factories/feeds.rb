FactoryBot.define do
  factory :feed do
    title { "タイトル" }
    url { "https://toyokeizai.net/list/feed/rss" }
    association :user
  end
end
