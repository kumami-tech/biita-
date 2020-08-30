class Review < ApplicationRecord
  validates :content, presence: true
  validates :score, presence: true
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :reviewee, class_name: 'User', foreign_key: 'reviewee_id'


  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1)
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end


  def display_position
    if self.position == "guest"
      "ツアーゲストとしての評価："
    else
      "ツアーキャストとしての評価："
    end
  end

end