require 'rails_helper'

describe PostsCController do
  let(:giver) { create(:user) }
  let(:current_user) { create(:user) }
  let(:post_c) { create(:post_c, giver: giver) }
  let(:post_c_taker) { create(:post_c_taker) }
  let(:reviews) { create_list(:review, 3, reviewee: giver) }
  let(:params) { { giver_id: giver.id, post_c: attributes_for(:post_c) } }
  # let!(:favorite) { create(:favorite_c, post_c_id: post_c.id, user_id: current_user.id) }

  describe 'GET #index' do
    let(:posts) { create_list(:post_c, 3) }

    before do
      get :index
    end
    
    it "投稿一覧ページに遷移すること" do
      expect(response).to render_template :index
    end
    
    it "HTTPのレスポンスが200であること" do
      expect(response).to have_http_status "200"
    end

    it "適切にインスタンス変数(@posts)が取り出されること" do
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: {id: post_c}
    end

    it "投稿詳細ページに遷移すること" do
      expect(response).to render_template :show
    end

    it "HTTPのレスポンスが200であること" do
      expect(response).to have_http_status "200"
    end

    it "適切にインスタンス変数(@post)が取り出されること" do
      expect(assigns(:post)).to eq post_c
    end

    it "適切にインスタンス変数(@user)が取り出されること" do
      expect(assigns(:user)).to eq giver
    end

    it "適切にインスタンス変数(@count)が取り出されること" do
      expect(assigns(:count)).to eq giver.reviews.count
    end

    # it "適切にインスタンス変数(@favorite)が取り出されること" do
    #   expect(assigns(:favorite)).to eq post_c.favorite_cs.where(user_id: current_user.id)
    # end

    it "適切にインスタンス変数(@takers)が取り出されること" do
      get :show, params: { id: post_c }
      expect(assigns(:takers)).to eq post_c.takers
    end
  end

  describe 'GET #new' do
    context "ユーザーがログインしている場合" do
      before do
        login giver
        get :new
      end

      it "新規投稿ページに遷移すること" do
        expect(response).to render_template :new
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@post)が取り出されること" do
        expect(assigns(:post)).to be_a_new(PostC)
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :new
      end

      it "ログイン画面にリダイレクトされること" do
        expect(response).to redirect_to new_user_session_path
      end

      it "HTTPのレスポンスが302であること" do
        expect(response).to have_http_status "302"
      end
    end
  end

  describe 'GET #edit' do
    context "ユーザーがログインしている場合" do
      before do
        login giver
        get :edit, params: {id: post_c}
      end

      it "投稿編集ページに遷移すること" do
        expect(response).to render_template :edit
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@post)が取り出されること" do
        expect(assigns(:post)).to eq post_c
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :edit, params: {id: post_c}
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

    context "ユーザーがログインしている場合" do
      before do
        login giver
      end

      context "投稿が保存できる場合" do
        subject {
          post :create,
               params: params
        }

        it "投稿が保存されること" do
          expect{ subject }.to change(PostC, :count).by(1)
        end

        it "投稿詳細ページにリダイレクトされること" do
          subject
          expect(response).to redirect_to posts_c_path(PostC.last)
        end
      end

      context "投稿が保存できない場合" do
        let(:invalid_params) { { giver_id: giver.id, post_c: attributes_for(:post_c, title: nil) } }

        subject {
          post :create,
               params: invalid_params
        }

        it "投稿が保存されないこと" do
          expect{ subject }.not_to change(PostC, :count)
        end

        it "新規投稿ページにリダイレクトされること" do
          subject
          expect(response).to redirect_to new_posts_c_path
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

  describe 'PATCH #update' do 

    context "ユーザーがログインしている場合" do
      before do
        login giver
      end
      
      context "投稿が保存できる場合" do
        let(:params) { { giver_id: giver.id, title: "新しいタイトル" } }
        subject {
          patch :update,
                params: {id: post_c.id, post_c: params}
        }
        it "投稿が保存されること" do
          subject
          expect(post_c.reload.title).to eq "新しいタイトル"
        end
      end

      context "投稿が保存できない場合" do
        let(:invalid_params) { { giver_id: giver.id, title: nil } }
        subject {
          patch :update,
                params: {id: post_c.id, post_c: invalid_params}
        }
        it "投稿が保存されないこと" do
          subject
          expect(post_c.reload.title).to eq "トロントの観光案内"
        end

        it "投稿編集ページにリダイレクトされること" do
          subject
          expect(response).to redirect_to edit_posts_c_path(post_c)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:post_c) { create(:post_c, giver: giver) }

    subject {
      delete :destroy,
             params: {id: post_c.id, post_c: params}
    }

    context "ユーザーがログインしている場合" do
      before do
        login giver
      end

      it "投稿を削除できること" do
        expect{ subject }.to change(PostC, :count).by(-1)
      end
    end

    context "ユーザーがログインしていない場合" do
      it "投稿を削除できないこと" do
        expect{ subject }.not_to change(PostC, :count)
      end
    end
  end

  describe 'GET #take' do

    context "ユーザーがログインしている場合" do
      before do
        login giver
      end

      subject {
        get :take,
            params: {id: post_c.id, post_c: params}
      }

      it "投稿に申し込めること" do
        expect{ subject }.to change(PostCTaker, :count).by(1)
      end

      it "投稿詳細ページにリダイレクトされること" do
        subject
        expect(response).to redirect_to posts_c_path(post_c)
      end
    end

    context "ユーザーがログインしていない場合" do
      subject {
        get :take,
            params: {id: post_c.id, post_c: params}
      }

      it "投稿に申し込めないこと" do
        expect{ subject }.not_to change(PostCTaker, :count)
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

  describe 'GET #cancel' do
    let!(:post_c) { create(:post_c, giver: giver) }
    let!(:post_c_taker) { create(:post_c_taker, taking_post_c: post_c, taker: giver) }

    context "ユーザーがログインしている場合" do
      before do
        login giver
      end

      subject {
        get :cancel,
            params: {id: post_c.id, taker_id: giver.id, post_c_taker: params}
      }

      it "投稿を削除できること" do
        expect{ subject }.to change(PostCTaker, :count).by(-1)
      end

      it "投稿詳細ページにリダイレクトされること" do
        subject
        expect(response).to redirect_to posts_c_path(post_c)
      end
    end

    context "ユーザーがログインしていない場合" do
      subject {
        get :cancel,
            params: {id: post_c.id, post_c: params}
      }

      it "投稿を削除できないこと" do
        expect{ subject }.not_to change(PostCTaker, :count)
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