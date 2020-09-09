class PostGTaker < ApplicationRecord
  belongs_to :taking_post_g, class_name: 'PostG', foreign_key: 'taker_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
end