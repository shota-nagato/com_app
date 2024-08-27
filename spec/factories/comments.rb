FactoryBot.define do
  factory :comment do
    content { "コメント" }
    association :user
  end
end
