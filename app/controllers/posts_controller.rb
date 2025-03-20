class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # 一覧と詳細はログインなしで閲覧可能
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]  

  # 🔹 **投稿一覧**
  def index
    @posts = Post.order(created_at: :desc) # 投稿を新しい順に取得
  end

  # 🔹 **投稿の新規作成フォーム**
  def new
    @post = Post.new
  end

  # 🔹 **投稿の作成**
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id  # ログインユーザーのIDをセット

    if @post.save
      redirect_to @post, notice: "投稿が作成されました！"
    else
      render :new
    end
  end

  # 🔹 **投稿詳細**
  def show
  end

  # 🔹 **投稿編集フォーム**
  def edit
  end

  # 🔹 **投稿の更新**
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました！"
    else
      render :edit
    end
  end

  # 🔹 **投稿の削除**
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  private

  # **投稿のパラメータ制限**
  def post_params
    params.require(:post).permit(:title, :content)
  end

  # **指定されたIDの投稿を取得**
  def set_post
    @post = Post.find(params[:id])
  end

  # **投稿の所有者のみ編集・削除を許可**
  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: "他のユーザーの投稿は編集・削除できません。"
    end
  end
end