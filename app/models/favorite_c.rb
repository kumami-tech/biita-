class FavoriteC < ApplicationRecord
  belongs_to :user
  belongs_to :post_c
  validates_uniqueness_of :post_c_id, scope: :user_id
end
