class PostG < ApplicationRecord
  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true
  validates :payment, presence: true

  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  has_many :post_g_takers
  has_many :takers, through: :post_g_takers
end