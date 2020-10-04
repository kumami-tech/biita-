class PostCTaker < ApplicationRecord
  belongs_to :taking_post_c, class_name: 'PostC', foreign_key: 'post_c_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
  validates_uniqueness_of :post_c_id, scope: :taker_id
end