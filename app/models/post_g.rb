class PostG < ApplicationRecord
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true

  belongs_to :user
end