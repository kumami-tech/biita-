class User < ApplicationRecord
  # ユーザー
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {maximum: 10}

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
    unless self.reviews.empty?
      reviews.average(:score).round(1)
    else
      0.0
    end
  end

end