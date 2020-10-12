FactoryBot.define do
  factory :message do
    text        { Faker::Lorem.sentence }
    image       { File.open("#{Rails.root}/public/images/test_image.jpg") }
    user
    group
  end
end