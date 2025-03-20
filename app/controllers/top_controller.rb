class TopController < ApplicationController
  def home
    @recent_posts = Post.order(created_at: :desc).limit(6)
  end

  def about
  end
end
