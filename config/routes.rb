Rails.application.routes.draw do
  # 🔐 Devise 認証
  devise_for :users
  devise_for :admins, path: "admin", path_names: {
    sign_in: "sign_in", sign_out: "sign_out"
  }

  # 🛠️ 管理者機能
  namespace :admin do
    root to: "top#index"  # 管理者トップページ（必要なら dashboard に変えてもOK）

    # 管理者用の投稿管理（一覧・削除）
    resources :posts, only: [:index, :destroy]

    # 管理者用コメント削除
    resources :comments, only: [:destroy]

    # 管理者用ユーザー管理（一覧・詳細・編集・削除）
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  # 🌟 トップページ / About
  root "top#home"
  get "about", to: "top#about"

  # 📝 投稿（レビュー） + コメント
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # 🔍 投稿検索（商品名）
  get "search", to: "posts#search", as: :search_posts

  # 👤 一般ユーザー用マイページ（show/edit/update/destroy）
  resources :users, only: [:show, :edit, :update, :destroy]
end