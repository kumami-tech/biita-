class PostG < ApplicationRecord
  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true
  validates :payment, presence: true

  belongs_to :user
end