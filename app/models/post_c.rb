class PostC < ApplicationRecord
  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true
  validates :payment, presence: true

  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id', optional: true
end