class PostC < ApplicationRecord
  default_scope->{order(created_at: :desc)}

  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true
  validates :payment, presence: true

  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  has_many :post_c_takers, dependent: :destroy
  has_many :takers, through: :post_c_takers, dependent: :destroy
  
  has_many :favorite_cs, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable

  def self.search(search)
    if search != ""
      PostC.where('title LIKE(?)', "%#{search}%")
    else
      PostC.all
    end
  end

  def create_notification_apply_c!(current_user, user, post)
    notification = current_user.active_notifications.new(
      post_c_id: post.id,
      visited_id: user.id,
      action: 'apply_c'
    )
    notification.save if notification.valid?
  end

  def create_notification_cancel_c!(current_user, user, post)
    notification = current_user.active_notifications.new(
      post_c_id: post.id,
      visited_id: user.id,
      action: 'cancel_c'
    )
    notification.save if notification.valid?
  end

  def create_notification_favorite_c!(current_user, user, post)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_c_id = ? and action = ? ", current_user.id, user.id, post.id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_c_id: post.id,
        visited_id: user.id,
        action: 'favorite_c'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end