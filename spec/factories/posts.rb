FactoryBot.define do
  factory :post_g do
    association :giver, factory: :user
    title        {"トロントで観光案内"}
    tag_list     {"#トロント"}
    region       {"カナダ・トロント"}
    datetime     {"9月24日"}
    charge       {"10000円"}
    payment      {"現地で手渡し"}
    content      {"トロントの観光案内"}
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

  factory :post_c do
    association :giver, factory: :user
    title        {"トロントで観光案内"}
    region       {"カナダ・トロント"}
    datetime     {"9月24日"}
    charge       {"10000円"}
    payment      {"現地で手渡し"}
    content      {"トロントの観光案内"}
  end
end