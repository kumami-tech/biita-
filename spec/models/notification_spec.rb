require 'rails_helper'

describe Notification do
  describe '#create' do
    context "保存できること" do
      it "メッセージが送信された時に保存されること" do
        notification = build(:notification, action: "message")
        expect(notification).to be_valid
      end

      it "レビューが投稿された時に保存されること" do
        notification = build(:notification, action: "review")
        expect(notification).to be_valid
      end

      it "ツアーゲストの投稿が申し込まれた時に保存されること" do
        notification = build(:notification, action: "apply_g")
        expect(notification).to be_valid
      end

      it "ツアーゲストの投稿がキャンセルされた時に保存されること" do
        notification = build(:notification, action: "cancel_g")
        expect(notification).to be_valid
      end

      it "ツアーゲストの投稿がお気に入りに追加された時に保存されること" do
        notification = build(:notification, action: "favorite_g")
        expect(notification).to be_valid
      end

      it "ツアーキャストの投稿が申し込まれた時に保存されること" do
        notification = build(:notification, action: "apply_c")
        expect(notification).to be_valid
      end

      it "ツアーキャストの投稿がキャンセルされた時に保存されること" do
        notification = build(:notification, action: "cancel_c")
        expect(notification).to be_valid
      end

      it "ツアーキャストの投稿がお気に入りに追加された時に保存されること" do
        notification = build(:notification, action: "favorite_c")
        expect(notification).to be_valid
      end

      it "ユーザーがフォローされた時に保存されること" do
        notification = build(:notification, action: "follow")
        expect(notification).to be_valid
      end
    end

    context "保存できないこと" do
      it "actionが空の場合は保存されないこと" do
        notification = build(:notification, action: "")
        notification.valid?
        expect(notification.errors[:action]).to include("を入力してください。")
      end

      it "actionの値が正しくない場合は保存されないこと" do
        notification = build(:notification, action: "comment")
        notification.valid?
        expect(notification.errors[:action]).to include("は一覧にありません")
      end

      it "通知の送信者が空の場合は保存されないこと" do
        notification = build(:notification, visitor: nil)
        notification.valid?
        expect(notification.errors[:visitor]).to include("を入力してください。")
      end

      it "通知の受信者が空の場合は保存されないこと" do
        notification = build(:notification, visited: nil)
        notification.valid?
        expect(notification.errors[:visited]).to include("を入力してください。")
      end

      it "checkedが空の場合は保存されないこと" do
        notification = build(:notification, checked: nil)
        notification.valid?
        expect(notification.errors[:checked]).to include("を入力してください。")
      end
    end
  end
end