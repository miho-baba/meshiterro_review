class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 下記の記述は、たくさんpost_imageを持っているという意味である
  has_many :post_images, dependent: :destroy

  has_one_attached :profile_image
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      
end
