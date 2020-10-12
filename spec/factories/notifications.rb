FactoryBot.define do
  factory :notification do
    association :visitor, factory: :user
    association :visited, factory: :user
    checked       { true }
    action        { "message" }
  end
end
