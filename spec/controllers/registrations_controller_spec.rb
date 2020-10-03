require 'rails_helper'

describe Users::RegistrationsController do
  let(:user) { create(:user, email: "old-address@com") }
  let(:another_user) { create(:user) }
  let(:params) { { user: attributes_for(:user) } }


  describe 'GET #new' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :new
      end

      it "ユーザー編集ページに遷移すること" do
        expect(response).to render_template :new
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end
  end

  describe 'POST #create' do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context "ユーザーが保存できる場合" do
      subject {
        post :create,
        params: params
      }
      it "ユーザーが保存されること" do
        expect{ subject }.to change(User, :count).by(1)
      end
    end

    context "ユーザーが保存できない場合" do
      let(:invalid_params) { { user: attributes_for(:user, email: nil) } }

      subject {
        post :create,
        params: invalid_params
      }

      it "ユーザーが保存されないこと" do
        expect{ subject }.not_to change(User, :count)
      end

      it "新規ユーザーページにリダイレクトされること" do
        subject
        expect(response).to render_template :new
      end
    end

  end



  describe 'GET #edit' do
    context "ユーザーがログインしている場合" do
      before do
        login user
        get :edit, params: {id: user}
      end

      it "ユーザー編集ページに遷移すること" do
        expect(response).to render_template :edit
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
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
      
      # context "ユーザーが保存できる場合" do
      #   let(:params) { { id: user.id, email: "new-address@com" } }
      #   subject {
      #     patch :update,
      #     params: {id: user.id, user: params}
      #   }
      #   it "ユーザーが保存されること" do
      #     subject
      #     expect(user.reload.email).to eq "new-address@com"
      #   end
      # end

      context "ユーザーが保存できない場合" do
        let(:invalid_params) { { id: user.id, email: nil } }
        subject {
          patch :update,
          params: {id: user.id, user: invalid_params}
        }
        it "ユーザーが保存されないこと" do
          subject
          expect(user.reload.email).to eq "old-address@com"
        end

        # it "ユーザー編集ページにリダイレクトされること" do
        #   subject
        #   expect(response).to render_template :edit
        # end
      end


      context "他のユーザーの場合" do
        before do
          login another_user
          get :edit, params: {id: user}
        end

        # it "ログイン画面にリダイレクトされること" do
        #   expect(response).to redirect_to new_user_session_path
        # end

        # it "HTTPのレスポンスが302であること" do
        #   expect(response).to have_http_status "302"
        # end
      end
    end
  end


  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

    subject {
      delete :destroy,
      params: {id: user.id, user: params}
    }

    context "ユーザーがログインしている場合" do
      before do
        login user
      end

      it "ユーザーを削除できること" do
        expect{ subject }.to change(User, :count).by(-1)
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end

      it "ユーザーを削除できないこと" do
        expect{ subject }.not_to change(User, :count)
      end
    end
  end

end