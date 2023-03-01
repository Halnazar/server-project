FactoryBot.define do
  factory :candidate_criterium_score do
    score { Faker::Number.between(from: 0, to: 100) }
    association :criterium
    association :candidate
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
