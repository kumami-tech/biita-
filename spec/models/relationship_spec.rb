require 'rails_helper'

describe Relationship do
  describe '#create' do
    let(:follower) { create(:user) }
    let(:following) { create(:user) }
    let!(:relationship) { create(:relationship, follower: follower, following: following) }

    it "followerとfollowingが存在すれば保存されること" do
      expect(relationship).to be_valid
    end

    it "同じfollowerとfollowingの組み合わせが2回以上保存されないこと" do
      relationship = build(:relationship, follower: follower, following: following)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include("はすでに存在します。")
    end

    it "followerが空の場合は保存されないこと" do
      relationship = build(:relationship, follower: nil)
      relationship.valid?
      expect(relationship.errors[:follower]).to include("を入力してください。")
    end

    it "followingが空の場合は保存されないこと" do
      relationship = build(:relationship, following: nil)
      relationship.valid?
      expect(relationship.errors[:following]).to include("を入力してください。")
    end
  end
end