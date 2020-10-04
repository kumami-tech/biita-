require 'rails_helper'

describe GroupsController do
  describe 'GET #index' do
    let(:user) { create(:user) }

    context "ユーザーがログインしている場合" do
      before do
        login user
        get :index
      end
      
      it "トークルームのトップページに遷移すること" do
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
end