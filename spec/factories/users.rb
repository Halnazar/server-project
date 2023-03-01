FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    name { Faker::Name.name }
    remember_created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sign_in_count { Faker::Number.between(from: 0, to: 100) }
    current_sign_in_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    last_sign_in_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    current_sign_in_ip { Faker::Internet.ip_v4_address }
    last_sign_in_ip { Faker::Internet.ip_v4_address }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    jti { SecureRandom.uuid }
  end
end
