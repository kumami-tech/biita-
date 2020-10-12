require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:messages) { create(:message, 3, group: group, user: user) }

  describe 'GET #index' do
    context "ユーザーがログインしている場合" do
      before do
        login user
        get :index, params: { group_id: group.id, user_id: user.id }
      end
      
      it "メッセージ一覧画面に遷移すること" do
        expect(response).to render_template :index
      end
      
      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@group)が取り出されること" do
        expect(assigns(:group)).to eq group
      end

      it "適切にインスタンス変数(@user)が取り出されること" do
        expect(assigns(:user)).to eq user
      end

      it "適切にインスタンス変数(@message)が取り出されること" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "適切にインスタンス変数(@messages)が取り出されること" do
        expect(assigns(:messages)).to eq user.messages
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :index, params: { group_id: group.id }
      end
      
      it "ログイン画面にリダイレクトされること" do
        expect(response).to redirect_to new_user_session_path
      end

      it "HTTPのレスポンスが302であること" do
        expect(response).to have_http_status "302"
      end
    end
  end

  describe 'POST #create' do
    let(:group_user) { create(:group_user, group: group) }
    let(:params) { { group_id: group.id, user_id: group_user.user.id, message: attributes_for(:message) } }

    context "ユーザーがログインしている場合" do
      before do
        login user
      end

      context "投稿が保存できる場合" do
        subject {
          post :create,
               params: params,
               xhr: true
        }

        it "メッセージが非同期で保存されること" do
          expect { subject }.to change(Message, :count).by(1)
        end
      end

      context "投稿が保存できない場合" do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, text: nil, image: nil) } }
        subject {
          post :create,
               params: invalid_params,
               xhr: true
        }

        it "メッセージが保存されないこと" do
          expect { subject }.not_to change(Message, :count)
        end

        it "メッセージ一覧画面にリダイレクトされること" do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context "ユーザーがログインしていない場合" do
      subject {
        post :create,
             params: params
      }

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
