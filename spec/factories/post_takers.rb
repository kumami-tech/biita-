FactoryBot.define do
  factory :post_g_taker do
    association :taker, factory: :user
    association :taking_post_g, factory: :post_g
  end
  
  factory :post_c_taker do
    association :taker, factory: :user
    association :taking_post_c, factory: :post_c
  end
end