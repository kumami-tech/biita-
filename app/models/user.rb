class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 10}

  has_many :post_gs
  has_many :post_cs

  has_many :group_users
  has_many :groups, through: :group_users

  has_many :messages
  has_many :reviews, foreign_key: "reviewee_id"

  mount_uploader :profile_image, ImageUploader


  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1)
    else
      0.0
    end
  end

end