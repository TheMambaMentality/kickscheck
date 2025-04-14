class PostsController < ApplicationController
  before_action :authenticate_user_or_admin!, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user_or_admin!, only: [:edit, :update, :destroy]

  # 🔹 投稿一覧
  def index
    @posts = Post.order(created_at: :desc)
  end

  # 🔍 検索機能（完全一致）
  def search
    @keyword = params[:keyword]
    @posts = Post.where(title: @keyword).order(created_at: :desc)
  end

  # 🔹 新規投稿フォーム
  def new
    @post = Post.new
  end

  # 🔹 投稿の作成
  def create
    @post = current_user.posts.build(post_params)
  
    if @post.save
      if @post.images.attached?
        # blobを使ってファイルを開く
        @post.images.first.blob.open do |file|
          tags = Vision.get_image_data(file)
          @post.tag_list.add(tags)
          @post.save
        end
      end
      redirect_to @post, notice: '投稿が完了しました'
    else
      render :new
    end
  end


  # 🔹 投稿詳細
  def show
  end

  # 🔹 編集フォーム
  def edit
  end

  # 🔹 投稿の更新
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました！"
    else
      render :edit
    end
  end

  # 🔹 投稿の削除
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_list, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  # ✅ 管理者は許可、ユーザーは本人のみ許可
  def authorize_user_or_admin!
    return if current_admin
    redirect_to posts_path, alert: "他のユーザーの投稿は編集・削除できません。" unless @post.user == current_user
  end
end
