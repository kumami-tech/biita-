class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 10}

  has_many :giving_post_gs, foreign_key: "giver_id", class_name: "PostG", dependent: :destroy
  has_many :giving_post_cs, foreign_key: "giver_id", class_name: "PostC", dependent: :destroy

  has_many :post_g_takers
  has_many :taking_post_gs, dependent: :destroy, through: :post_g_takers
  has_many :taking_post_cs, dependent: :destroy, through: :post_c_takers

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  has_many :messages, dependent: :destroy
  has_many :reviews, foreign_key: "reviewee_id", dependent: :destroy

  mount_uploader :profile_image, ImageUploader


  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1)
    else
      0.0
    end
  end

end