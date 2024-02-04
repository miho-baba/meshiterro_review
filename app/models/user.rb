class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 下記の記述は、たくさんpost_imageを持っているという意味である
  has_many :post_images, dependent: :destroy

  has_one_attached :profile_image

  # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定。
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像を縦横共に100pxのサイズに変換する。
    profile_image.variant(resize_to_limit: [100,100]).processed
  end
end
