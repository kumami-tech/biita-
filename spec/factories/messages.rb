FactoryBot.define do
  factory :message do
    text        {"こんにちは"}
    image       {"image.jpg"}
    user
    group
  end
end