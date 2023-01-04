FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "タイトル#{n}" }
  end
end
