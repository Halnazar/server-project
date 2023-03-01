FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    reset_password_token { Faker::Internet.password }
    reset_password_sent_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    remember_created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    name { Faker::Name.name }
  end
end
