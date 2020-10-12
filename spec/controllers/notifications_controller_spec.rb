require 'rails_helper'

describe NotificationsController do
  let(:user) { create(:user) }
  let!(:notification) { create(:notification) }

  describe 'GET #index' do
    context "ユーザーがログインしている場合" do
      before do
        login user
        get :index
      end

      it "通知一覧ページに遷移すること" do
        expect(response).to render_template :index
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :index
      end

      it "ログイン画面にリダイレクトされること" do
        expect(response).to redirect_to new_user_session_path
      end

      it "HTTPのレスポンスが302であること" do
        expect(response).to have_http_status "302"
      end
    end
  end

  describe 'DELETE #destroy' do
    subject do
      delete :destroy,
             params: { id: notification.id }
    end

    context "ユーザーがログインしている場合" do
      before do
        login user
      end

      it "通知を削除できること" do
        expect { subject }.to change(Notification, :count).by(-1)
      end
    end

    context "ユーザーがログインしていない場合" do
      it "ログイン画面にリダイレクトされること" do
        subject
        expect(response).to redirect_to new_user_session_path
      end

      it "HTTPのレスポンスが302であること" do
        subject
        expect(response).to have_http_status "302"
      end
    end
  end
end
