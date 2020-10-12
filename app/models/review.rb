class Review < ApplicationRecord
  validates :content, presence: true
  validates :score, presence: true
  validates :position, presence: true
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :reviewee, class_name: 'User', foreign_key: 'reviewee_id'
  has_many :notifications, dependent: :destroy

  def display_position
    if position == "guest"
      "ツアーゲストとしての評価　"
    else
      "ツアーキャストとしての評価　"
    end
  end

  def create_notification_review!(current_user, user)
    notification = current_user.active_notifications.new(
      visited_id: user.id,
      action: 'review'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
