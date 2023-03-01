FactoryBot.define do
  factory :vacancy do
    status { false }
    opening_date { Date.today }
    position
  end
end
