Rails.application.routes.draw do
  devise_for :users  # Deviseによるユーザー認証

  root "top#home"   # ルートパスをtop#homeに設定
  get "about", to: "top#about"  # /about でtop#aboutにアクセス

  # 他のルーティングを追加する場合はここに記述
end