FactoryBot.define do
  factory :question do
    title { "title" }
    content { "content" }
    association :user
  end
end
