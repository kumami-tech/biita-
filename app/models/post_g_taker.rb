class PostGTaker < ApplicationRecord
  belongs_to :post_g
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id', optional: true
end