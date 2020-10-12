class PostG < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :charge, presence: true
  validates :payment, presence: true
  validates :content, presence: true

  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  has_many :post_g_takers, dependent: :destroy
  has_many :takers, through: :post_g_takers, dependent: :destroy

  has_many :favorite_gs, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      PostG.where('title LIKE(?)', "%#{search}%")
    else
      PostG.all
    end
  end

  def create_notification_apply_g!(current_user, user, post)
    notification = current_user.active_notifications.new(
      post_g_id: post.id,
      visited_id: user.id,
      action: 'apply_g'
    )
    notification.save if notification.valid?
  end

  def create_notification_cancel_g!(current_user, user, post)
    notification = current_user.active_notifications.new(
      post_g_id: post.id,
      visited_id: user.id,
      action: 'cancel_g'
    )
    notification.save if notification.valid?
  end

  def create_notification_favorite_g!(current_user, user, post)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_g_id = ? and action = ? ", current_user.id, user.id, post.id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_g_id: post.id,
        visited_id: user.id,
        action: 'favorite_g'
      )
      notification.save if notification.valid?
    end
  end
end
