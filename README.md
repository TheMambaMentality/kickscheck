# KicksCheck
## サイト概要
### サイトテーマ
お気に入りのバスケットボールシューズについて投稿したり、評価を閲覧できるレビューサイト

​
### テーマを選んだ理由
制作者である私自身バスケットボールという競技に心血を注いでいます。
そんなバスケットボールという競技と切っても切れないのがバスケットシューズという用具です。
私自身バスケットボールシューズに対して強いコダワリがあるように、各プレーヤーによってそれぞれコダワリがあると考えています。
また、買い物の仕方はストアでの購入から、オンラインという選択肢が増え取り扱い商品数等も考慮すると、オンラインでの購入が便利と言わざるを得ません。
そんな、実物を見れない環境でも商品についてのレビューサイトがあると、購入の手助けになるのではと思い、このポートフォリオ制作を制作してみようと考えました。

また、バスケットボールシューズに対してコダワリを見つけられていないユーザーにも、それぞれのコダワリが見つけられる、コダワリについて考えられる、そんなサイトになればと考えています。

### ターゲットユーザ
自身が履いているバスケットボールシューズについてレビューしたい人
自身が履いているバスケットボールシューズについてのレビューをみたい人
新しくバスケットボールシューズの購入を検討しているがどれが良いかわからない人
購入を検討しているバスケットボールシューズのレビューが見たい人
​
### 主な利用シーン
バスケットボールシューズについてのレビューを投稿する時
新しいバスケットボールシューズを探している時
使用しているバスケットボールシューズのレビューをみたい時

## 設計書
後ほど作成予定
​
## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

# ブランチの作成
git checkout -b ブランチ名

# ブランチをきる（ブランチの移動）
git checkout ブランチ名

# 変更履歴を残す準備
git add ファイル名
git add .  (全ファイル保存)

# 変更履歴を保存（ローカル）
git commit -m "メッセージ"


# git push
git push origin ブランチ名

# 他の人がdevelopにマージしたものを自分のマージに取り込む手順
## 1.developにマージされたものをとってくるためにdevelopに移動
  git checkout develop
## 2.プルする (動作確認rails s)
  git pull origin develop
## 3.自分のブランチに戻る
  git checkout 自分のブランチ
## 4.自分のブランチにマージする（取り込む）
  git merge develop



# 変更点の確認
git diff

# コミット履歴
git log