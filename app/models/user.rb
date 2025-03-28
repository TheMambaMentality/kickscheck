class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy  # ← 投稿があるなら追加

  validates :name, presence: true

  # 有効ユーザーのスコープ
  scope :active, -> { where(is_deleted: false) }

  # 退会済みユーザーはログインできないようにする
  def active_for_authentication?
    super && !is_deleted
  end

  # エラーメッセージのカスタマイズ（任意）
  def inactive_message
    is_deleted ? :deleted_account : super
  end
end