class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :post_gs
  has_many :post_cs

  has_many :group_users
  has_many :groups, through: :group_users

  has_many :messages
  has_many :reviews

  mount_uploader :profile_image, ImageUploader
end