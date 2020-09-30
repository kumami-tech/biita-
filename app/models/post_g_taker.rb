class PostGTaker < ApplicationRecord
  belongs_to :taking_post_g, class_name: 'PostG', foreign_key: 'post_g_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
  validates_uniqueness_of :post_g_id, scope: :taker_id
end