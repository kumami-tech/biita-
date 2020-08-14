class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text, presence: true, unless: :image_id?

  attachment :image
end