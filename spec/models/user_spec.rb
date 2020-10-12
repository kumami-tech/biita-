require 'rails_helper'

describe User do
  describe '#create' do
    it "全て入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ユーザー名が空である場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください。")
    end

    it "メールアドレスが空である場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "メールアドレスに@とドメインが空である場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: "yamadacom")
      another_user.valid?
      expect(another_user.errors[:email]).to include("は不正な値です")
    end

    it "重複したメールアドレスが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します。")
    end

    it "パスワードが空である場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end
   
    it "パスワードが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください。")
    end

    it "パスワード再入力が空である場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end

    it "パスワード再入力が入力されていても、パスワードと一致しない場合は登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end
  end
end