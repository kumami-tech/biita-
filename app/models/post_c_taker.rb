class PostCTaker < ApplicationRecord
  belongs_to :taking_post_c, class_name: 'PostC', foreign_key: 'post_c_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
end