Rails.application.routes.draw do
  devise_for :users  # Deviseによるユーザー認証

  root "top#home"   # ルートパスをtop#homeに設定
  get "about", to: "top#about"  # /about でtop#aboutにアクセス

  # 投稿のルーティングを追加（edit, update, destroy も追加）
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end