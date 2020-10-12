class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  def create_notification_message!(current_user, user, group)
    notification = current_user.active_notifications.new(
      group_id: group.id,
      visited_id: user.id,
      action: 'message'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
