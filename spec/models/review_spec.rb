require 'rails_helper'

describe Review do
  describe '#create' do
    it "全てが入力されていれば保存できること" do
      review = build(:review)
      expect(review).to be_valid
    end

    it "テキストが空の場合は保存できないこと" do
      review = build(:review, content: nil)
      review.valid?
      expect(review.errors[:content]).to include("を入力してください。")
    end

    it "点数が空の場合は保存できないこと" do
      review = build(:review, score: nil)
      review.valid?
      expect(review.errors[:score]).to include("を入力してください。")
    end

    it "評価する対象の立場が空の場合は保存できないこと" do
      review = build(:review, position: nil)
      review.valid?
      expect(review.errors[:position]).to include("を入力してください。")
    end

    it "レビューされるユーザーが空の場合は保存できないこと" do
      review = build(:review, reviewee_id: nil)
      review.valid?
      expect(review.errors[:reviewee]).to include("を入力してください。")
    end

    it "レビューするユーザーが空の場合は保存できないこと" do
      review = build(:review, reviewer_id: nil)
      review.valid?
      expect(review.errors[:reviewer]).to include("を入力してください。")
    end
  end
end