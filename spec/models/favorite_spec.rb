require 'rails_helper'

describe FavoriteG do
  describe '#create' do
    let(:user) { create(:user) }
    let(:post) { create(:post_g) }
    let!(:favorite) { create(:favorite_g, user: user, post_g: post) }

    it "投稿とユーザーが存在すれば保存されること" do
      expect(favorite).to be_valid
    end

    it "一つの投稿に同じユーザーが2回以上保存できないこと" do
      favorite = build(:favorite_g, user: user, post_g: post)
      favorite.valid?
      expect(favorite.errors[:post_g_id]).to include("はすでに存在します。")
    end

    it "投稿が空の場合は保存されないこと" do
      favorite = build(:favorite_g, post_g: nil)
      favorite.valid?
      expect(favorite.errors[:post_g]).to include("を入力してください。")
    end

    it "ユーザーが空の場合は保存されないこと" do
      favorite = build(:favorite_g, user: nil)
      favorite.valid?
      expect(favorite.errors[:user]).to include("を入力してください。")
    end
  end
end

describe FavoriteC do
  describe '#create' do
    let(:user) { create(:user) }
    let(:post) { create(:post_c) }
    let!(:favorite) { create(:favorite_c, user: user, post_c: post) }

    it "投稿とユーザーが存在すれば保存されること" do
      expect(favorite).to be_valid
    end

    it "一つの投稿に同じユーザーが2回以上保存できないこと" do
      favorite = build(:favorite_c, user: user, post_c: post)
      favorite.valid?
      expect(favorite.errors[:post_c_id]).to include("はすでに存在します。")
    end

    it "投稿が空の場合は保存されないこと" do
      favorite = build(:favorite_c, post_c: nil)
      favorite.valid?
      expect(favorite.errors[:post_c]).to include("を入力してください。")
    end

    it "ユーザーが空の場合は保存されないこと" do
      favorite = build(:favorite_c, user: nil)
      favorite.valid?
      expect(favorite.errors[:user]).to include("を入力してください。")
    end
  end
end