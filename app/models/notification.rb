class Notification < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }

  belongs_to :post_g, optional: true
  belongs_to :post_c, optional: true
  belongs_to :group, optional: true
  belongs_to :review, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id'
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id'
  ACTION_VALUES = %w[message review apply_g apply_c cancel_g cancel_c favorite_g favorite_c follow].freeze
  validates :action, presence: true, inclusion: { in: ACTION_VALUES }
end
