FactoryBot.define do
  factory :favorite_g do
    user
    post_g
  end

  factory :favorite_c do
    user
    post_c
  end
end