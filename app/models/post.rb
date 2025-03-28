class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  # 対応形式のバリデーション
  validate :images_format

  private

  def images_format
    images.each do |image|
      unless image.content_type.in?(%w[image/jpeg image/png image/webp])
        errors.add(:images, 'はJPEG・PNG・WEBP形式のみアップロード可能です')
      end
    end
  end
end