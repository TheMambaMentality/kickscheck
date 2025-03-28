class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_comment, only: [:destroy]
  
    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to post_path(@post), notice: "コメントを投稿しました"
      else
        redirect_to post_path(@post), alert: "コメントを投稿できませんでした"
      end
    end
  
    def destroy
      if @comment.user == current_user
        @comment.destroy
        redirect_to post_path(@post), notice: "コメントを削除しました"
      else
        redirect_to post_path(@post), alert: "他人のコメントは削除できません"
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_comment
      @comment = @post.comments.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
