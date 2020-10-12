require 'rails_helper'

describe Message do
  describe '#create' do
    context "保存できること" do
      it "テキストと画像の両方を一度に保存できること" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "画像が空でも、テキストが入力されていれば保存できること" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it "テキストが空でも、画像が入力されていれば保存できること" do
        message = build(:message, text: nil)
        expect(message).to be_valid
      end
    end

    context "保存できないこと" do
      it "テキストと画像が空の場合は保存できないこと" do
        message = build(:message, text: nil, image: nil)
        message.valid?
        expect(message.errors[:text]).to include("を入力してください。")
      end

      it "グループが空の場合は保存できないこと" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください。")
      end

      it "ユーザーが空の場合は保存できないこと" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください。")
      end
    end
  end
end
