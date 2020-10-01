require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:reviews) { create_list(:review, 3, reviewee: user) }

  describe 'GET #show' do
    before do
      get :show, params: {id: user}
    end

    it "ユーザー詳細ページに遷移すること" do
      expect(response).to render_template :show
    end

    it "HTTPのレスポンスが200であること" do
      expect(response).to have_http_status "200"
    end

    it "適切にインスタンス変数(@user)が取り出されること" do
      expect(assigns(:user)).to eq user
    end

    it "適切にインスタンス変数(@giving_post_gs)が取り出されること" do
      expect(assigns(:giving_post_gs)).to eq user.giving_post_gs
    end

    it "適切にインスタンス変数(@giving_post_cs)が取り出されること" do
      expect(assigns(:giving_post_cs)).to eq user.giving_post_cs
    end

    it "適切にインスタンス変数(@taking_post_gs)が取り出されること" do
      expect(assigns(:taking_post_gs)).to eq user.taking_post_gs
    end

    it "適切にインスタンス変数(@taking_post_cs)が取り出されること" do
      expect(assigns(:taking_post_cs)).to eq user.taking_post_cs
    end

    it "適切にインスタンス変数(@count)が取り出されること" do
      expect(assigns(:count)).to eq user.reviews.count
    end
  end

  describe 'GET #edit' do
    context "ユーザーがログインしている場合" do
      before do
        login user
        get :edit, params: {id: user}
      end

      it "プロフィール編集ページに遷移すること" do
        expect(response).to render_template :edit
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@user)が取り出されること" do
        expect(assigns(:user)).to eq user
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :edit, params: {id: user}
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