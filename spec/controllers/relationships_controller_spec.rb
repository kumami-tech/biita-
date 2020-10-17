require 'rails_helper'

describe RelationshipsController do
  let(:user) { create(:user) }
  let(:current_user) { create(:user) }

  describe 'GET #followings' do
    context "ユーザーがログインしている場合" do
      before do
        login current_user
        get :followings, params: { id: user.id }
      end

      it "フォロー中のユーザー一覧ページに遷移すること" do
        expect(response).to render_template :followings
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@user)が取り出されること" do
        expect(assigns(:user)).to eq user
      end

      it "適切にインスタンス変数(@followings)が取り出されること" do
        expect(assigns(:followings)).to eq user.followings
      end

      it "適切にインスタンス変数(@followers)が取り出されること" do
        expect(assigns(:followers)).to eq user.followers
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :followings, params: { id: user.id }
      end

      it "フォロー中のユーザー一覧ページに遷移すること" do
        expect(response).to render_template :followings
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end
    end
  end

  describe 'GET #followers' do
    context "ユーザーがログインしている場合" do
      before do
        login user
        get :followers, params: { id: user.id }
      end

      it "フォロワー一覧ページに遷移すること" do
        expect(response).to render_template :followers
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@user)が取り出されること" do
        expect(assigns(:user)).to eq user
      end

      it "適切にインスタンス変数(@followings)が取り出されること" do
        expect(assigns(:followings)).to eq user.followings
      end

      it "適切にインスタンス変数(@followers)が取り出されること" do
        expect(assigns(:followers)).to eq user.followers
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :followers, params: { id: user.id }
      end

      it "フォロワー一覧ページに遷移すること" do
        expect(response).to render_template :followers
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end
    end
  end

  describe 'POST #create' do
    subject do
      post :create,
           params: { id: user.id, follower_id: user.id },
           xhr: true
    end

    context "ユーザーがログインしている場合" do
      before do
        login current_user
      end

      it "フォローできること" do
        expect { subject }.to change(Relationship, :count).by(1)
      end
    end

    context "ユーザーがログインしていない場合" do
      subject do
        post :create,
             params: { id: user.id, follower_id: user.id }
      end
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

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:current_user) { create(:user) }
    let!(:relationship) { create(:relationship, following_id: current_user.id, follower_id: user.id) }

    subject do
      delete :destroy,
             params: { id: user.id },
             xhr: true
    end

    context "ユーザーがログインしている場合" do
      before do
        login current_user
      end

      it "フォローを解除できること" do
        expect { subject }.to change(Relationship, :count).by(-1)
      end
    end

    context "ユーザーがログインしていない場合" do
      subject do
        post :create,
             params: { id: user.id, follower_id: user.id }
      end
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
