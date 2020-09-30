require 'rails_helper'

describe GroupUser do
  describe '#create' do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let!(:group_user) { create(:group_user, user: user, group: group) }

    it "グループとユーザーが存在すれば保存されること" do
      group_user = build(:group_user)
      expect(group_user).to be_valid
    end

    it "一つのグループに同じユーザーが2回以上保存されないこと" do
      group_user = build(:group_user, user: user, group: group)
      group_user.valid?
      expect(group_user.errors[:group_id]).to include("はすでに存在します。")
    end

    it "グループが空の場合は保存されないこと" do
      group_user = build(:group_user, group_id: nil)
      group_user.valid?
      expect(group_user.errors[:group]).to include("を入力してください。")
    end

    it "ユーザーが空の場合は保存されないこと" do
      group_user = build(:group_user, user_id: nil)
      group_user.valid?
      expect(group_user.errors[:user]).to include("を入力してください。")
    end
  end
end