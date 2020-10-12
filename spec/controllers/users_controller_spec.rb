require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  
  describe 'GET #show' do
    let(:reviews) { create_list(:review, 3, reviewee: user) }

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

  describe 'PATCH #update' do 

    context "ユーザーがログインしている場合" do
      before do
        login user
      end
      
      let(:params) { { user_id: user.id, profile: "新しいプロフィール" } }
      subject {
        patch :update,
              params: {id: user.id, user: params}
      }
      
      it "プロフィールが保存されること" do
        subject
        expect(user.reload.profile).to eq "新しいプロフィール"
      end
    end

    context "ユーザーがログインしていない場合" do
      let(:params) { { user_id: user.id, profile: "新しいプロフィール" } }
      subject {
        patch :update,
              params: {id: user.id, user: params}
      }
      
      it "プロフィールが保存されないこと" do
        subject
        expect(user.reload.profile).to eq nil
      end
    end

    context "他のユーザーの場合" do
      let(:another_user) { create(:user) }
      let(:params) { { user_id: user.id, profile: "新しいプロフィール" } }

      subject {
        patch :update,
              params: {id: user.id, user: params}
      }
      
      it "プロフィールが保存されないこと" do
        login another_user
        subject
        expect(user.reload.profile).to eq nil
      end
    end
  end

end