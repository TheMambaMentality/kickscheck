class TopController < ApplicationController
  # トップページとアバウトページはログイン不要
  skip_before_action :authenticate_user_or_admin!

  def home
    @recent_posts = Post.order(created_at: :desc).limit(6)
  end

  def about
  end
end
