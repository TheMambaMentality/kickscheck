class User < ApplicationRecord
  self.table_name = "users"  # 念のため追加

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end