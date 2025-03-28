class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:destroy]

  def index
    @posts = Post.includes(:user, :comments).order(created_at: :desc)
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end