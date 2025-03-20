class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:home, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ログアウト後にトップページへリダイレクト
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end