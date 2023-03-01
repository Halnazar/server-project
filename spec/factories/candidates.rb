FactoryBot.define do
  factory :candidate do
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    number { Faker::PhoneNumber.cell_phone }
    expirience_years { Faker::Number.between(from: 0, to: 10) }
    biography { Faker::Lorem.paragraph }
    association :vacancy
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    status { 'pending' }
    gender { Faker::Boolean.boolean }
    association :user, factory: :admin_user
  end
end
