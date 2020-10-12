FactoryBot.define do
  factory :review do
    association :reviewee, factory: :user
    association :reviewer, factory: :user
    content                  { Faker::Lorem.sentence }
    score                    { "5" }
    position                 { "guest" }
  end
end