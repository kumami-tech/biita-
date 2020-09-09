class PostC < ApplicationRecord
  validates :title, presence: true
  validates :region, presence: true
  validates :datetime, presence: true
  validates :content, presence: true
  validates :charge, presence: true
  validates :payment, presence: true

  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  has_many :post_c_takers
  has_many :takers, through: :post_c_takers

  def self.search(search)
    if search != ""
      PostC.where('title LIKE(?)', "%#{search}%")
    else
      PostC.all
    end
  end
end