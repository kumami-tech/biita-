require 'rails_helper'

describe PostG do
  describe '#create' do
    it "全て入力されていれば登録できること" do
      post = build(:post_g)
      expect(post).to be_valid
    end

    it "タイトルが空の場合は登録できないこと" do
      post = build(:post_g, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください。")
    end

    it "タグが空の場合でも登録できること" do
      post = build(:post_g, tag_list: nil)
      expect(post).to be_valid
    end

    it "場所が空の場合は登録できないこと" do
      post = build(:post_g, region: nil)
      post.valid?
      expect(post.errors[:region]).to include("を入力してください。")
    end

    it "日時が空の場合は登録できないこと" do
      post = build(:post_g, datetime: nil)
      post.valid?
      expect(post.errors[:datetime]).to include("を入力してください。")
    end

    it "料金が空の場合は登録できないこと" do
      post = build(:post_g, charge: nil)
      post.valid?
      expect(post.errors[:charge]).to include("を入力してください。")
    end

    it "支払い方法が空の場合は登録できないこと" do
      post = build(:post_g, payment: nil)
      post.valid?
      expect(post.errors[:payment]).to include("を入力してください。")
    end

    it "リクエスト内容が空の場合は登録できないこと" do
      post = build(:post_g, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください。")
    end

    it "投稿者が空の場合は登録できないこと" do
      post = build(:post_g, giver_id: nil)
      post.valid?
      expect(post.errors[:giver]).to include("を入力してください。")
    end
  end
end

describe PostC do
  describe '#create' do
    it "全て入力されていれば登録できること" do
      post = build(:post_g)
      expect(post).to be_valid
    end

    it "タイトルが空の場合は登録できないこと" do
      post = build(:post_c, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください。")
    end

    it "タグが空の場合でも登録できること" do
      post = build(:post_g, tag_list: nil)
      expect(post).to be_valid
    end

    it "場所が空の場合は登録できないこと" do
      post = build(:post_c, region: nil)
      post.valid?
      expect(post.errors[:region]).to include("を入力してください。")
    end

    it "日時が空の場合は登録できないこと" do
      post = build(:post_c, datetime: nil)
      post.valid?
      expect(post.errors[:datetime]).to include("を入力してください。")
    end

    it "料金が空の場合は登録できないこと" do
      post = build(:post_c, charge: nil)
      post.valid?
      expect(post.errors[:charge]).to include("を入力してください。")
    end

    it "支払い方法が空の場合は登録できないこと" do
      post = build(:post_c, payment: nil)
      post.valid?
      expect(post.errors[:payment]).to include("を入力してください。")
    end

    it "リクエスト内容が空の場合は登録できないこと" do
      post = build(:post_c, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください。")
    end

    it "投稿者が空の場合は登録できないこと" do
      post = build(:post_c, giver_id: nil)
      post.valid?
      expect(post.errors[:giver]).to include("を入力してください。")
    end
  end
end