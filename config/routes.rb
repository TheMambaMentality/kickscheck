Rails.application.routes.draw do
  namespace :admin do
    get 'top/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/destroy'
  end
  namespace :admin do
    get 'comments/destroy'
  end
  # Devise 認証
  devise_for :users
  devise_for :admins, path: "admin", path_names: {
    sign_in: "sign_in", sign_out: "sign_out"
  }

  # トップページ・アバウト
  root "top#home"
  get "about", to: "top#about"

  # 投稿 + コメント + 検索
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get "search", to: "posts#search", as: :search_posts

  # 管理者投稿管理画面
  namespace :admin do
  get 'top', to: 'top#index'
    resources :posts, only: [:index, :destroy]
    resources :comments, only: [:destroy] 
    resources :users, only: [:index, :destroy] 
  end
end