class User < ApplicationRecord
  # ユーザー
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 10 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  mount_uploader :profile_image, ImageUploader

  # 投稿
  has_many :giving_post_gs, foreign_key: "giver_id", class_name: "PostG", dependent: :destroy
  has_many :giving_post_cs, foreign_key: "giver_id", class_name: "PostC", dependent: :destroy

  has_many :post_g_takers, foreign_key: "taker_id", dependent: :destroy
  has_many :taking_post_gs, through: :post_g_takers, source: :taking_post_g, dependent: :destroy
  has_many :post_c_takers, foreign_key: "taker_id", dependent: :destroy
  has_many :taking_post_cs, through: :post_c_takers, source: :taking_post_c, dependent: :destroy

  has_many :favorite_gs, dependent: :destroy
  has_many :favorite_cs, dependent: :destroy

  # メッセージ
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :messages, dependent: :destroy

  # レビュー
  has_many :reviews, foreign_key: "reviewee_id", dependent: :destroy

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1)
    end
  end

  # 通知
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # フォロー
  has_many :following_relationships, foreign_key: "following_id", class_name: "Relationship",  dependent: :destroy
  has_many :followings, through: :following_relationships, source: :follower
  has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :following

  def following?(other_user)
    followings.include?(other_user)
  end

  def follow(other_user)
    following_relationships.create(follower_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(follower_id: other_user.id).destroy
  end

  def create_notification_follow!(current_user, user)
    notification = current_user.active_notifications.new(
      visited_id: user.id,
      action: 'follow'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
