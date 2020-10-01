require 'rails_helper'

describe PostsCController do
  describe 'GET #index' do
    let(:posts) { create_list(:post_c, 3) }

    it "投稿一覧ページに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
    
    it "HTTPのレスポンスが200であること" do
      get :index
      expect(response).to have_http_status "200"
    end

    it "適切にインスタンス変数(@posts)が取り出されること" do
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end

  describe 'GET #show' do
    let(:giver) { create(:user) }
    let(:current_user) { create(:user) }
    let(:post) { create(:post_c, giver: giver) }
    let(:reviews) { create_list(:review, 3, reviewee: giver) }
    # let!(:favorite) { create(:favorite_c, post_c: post, user: current_user) }
    let!(:post_takers) { create_list(:post_c_taker, 3, post_c_id: post.id) }

    before do
      get :show, params: {id: post.id}
    end

    it "投稿詳細ページに遷移すること" do
      expect(response).to render_template :show
    end

    it "HTTPのレスポンスが200であること" do
      expect(response).to have_http_status "200"
    end

    it "適切にインスタンス変数(@post)が取り出されること" do
      expect(assigns(:post)).to eq post
    end

    it "適切にインスタンス変数(@user)が取り出されること" do
      expect(assigns(:user)).to eq giver
    end

    it "適切にインスタンス変数(@count)が取り出されること" do
      expect(assigns(:count)).to eq giver.reviews.count
    end

    # it "適切にインスタンス変数(@favorite)が取り出されること" do
    #   expect(assigns(:favorite)).to eq post.favorite_cs.where(user: current_user)
    # end

    it "適切にインスタンス変数(@takers)が取り出されること" do
      get :show, params: { id: post }
      expect(assigns(:takers)).to eq post.takers
    end
  end

  describe 'GET #new' do
    let(:giver) { create(:user) }

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
    let(:giver) { create(:user) }
    let(:post) { create(:post_c) }

    context "ユーザーがログインしている場合" do
      before do
        login giver
        get :edit, params: {id: post}
      end

      it "投稿編集ページに遷移すること" do
        expect(response).to render_template :edit
      end

      it "HTTPのレスポンスが200であること" do
        expect(response).to have_http_status "200"
      end

      it "適切にインスタンス変数(@post)が取り出されること" do
        expect(assigns(:post)).to eq post
      end
    end

    context "ユーザーがログインしていない場合" do
      before do
        get :edit, params: {id: post}
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