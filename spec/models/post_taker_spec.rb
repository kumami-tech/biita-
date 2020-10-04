require 'rails_helper'

describe PostGTaker do
  describe '#create' do
    let(:taker) { create(:user) }
    let(:post) { create(:post_g) }
    let!(:post_taker) { create(:post_g_taker, taker: taker, taking_post_g: post) }

    it "投稿とユーザーが存在すれば保存されること" do
      expect(post_taker).to be_valid
    end

    it "一つの投稿に同じユーザーが2回以上申し込めないこと" do
      post_taker = build(:post_g_taker, taker: taker, taking_post_g: post)
      post_taker.valid?
      expect(post_taker.errors[:post_g_id]).to include("はすでに存在します。")
    end

    it "投稿が空の場合は保存されないこと" do
      post_taker = build(:post_g_taker, taking_post_g: nil)
      post_taker.valid?
      expect(post_taker.errors[:taking_post_g]).to include("を入力してください。")
    end

    it "ユーザーが空の場合は保存されないこと" do
      post_taker = build(:post_g_taker, taker: nil)
      post_taker.valid?
      expect(post_taker.errors[:taker]).to include("を入力してください。")
    end
  end
end

describe PostCTaker do
  describe '#create' do
    let(:taker) { create(:user) }
    let(:post) { create(:post_c) }
    let!(:post_taker) { create(:post_c_taker, taker: taker, taking_post_c: post) }

    it "投稿とユーザーが存在すれば保存されること" do
      expect(post_taker).to be_valid
    end

    it "一つの投稿に同じユーザーが2回以上申し込めないこと" do
      post_taker = build(:post_c_taker, taker: taker, taking_post_c: post)
      post_taker.valid?
      expect(post_taker.errors[:post_c_id]).to include("はすでに存在します。")
    end

    it "投稿が空の場合は保存されないこと" do
      post_taker = build(:post_c_taker, taking_post_c: nil)
      post_taker.valid?
      expect(post_taker.errors[:taking_post_c]).to include("を入力してください。")
    end

    it "ユーザーが空の場合は保存されないこと" do
      post_taker = build(:post_c_taker, taker: nil)
      post_taker.valid?
      expect(post_taker.errors[:taker]).to include("を入力してください。")
    end
  end
end