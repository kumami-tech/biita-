class Review < ApplicationRecord
  validates :content, presence: true
  validates :score, presence: true
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :reviewee, class_name: 'User', foreign_key: 'reviewee_id'
end
