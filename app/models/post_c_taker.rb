class PostCTaker < ApplicationRecord
  belongs_to :post_c
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id', optional: true
end