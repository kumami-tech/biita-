class FavoriteG < ApplicationRecord
  belongs_to :user
  belongs_to :post_g
  validates_uniqueness_of :post_g_id, scope: :user_id
end
