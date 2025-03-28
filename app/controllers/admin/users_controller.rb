class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:destroy]

  def index
    @users = User.order(created_at: :desc)
  end

  def destroy
    @user.update(is_deleted: true)
    redirect_to admin_users_path, notice: "ユーザーを退会させました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end