class ApplicationController < ActionController::Base
  before_action :authenticate_user_or_admin!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # 管理者ログイン後の遷移先
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path 
    else
      posts_path
    end
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  # ユーザー or 管理者 どちらかに応じて認証
  def authenticate_user_or_admin!
    if request.path.start_with?("/admin")
      authenticate_admin!
    else
      authenticate_user!
    end
  end
end