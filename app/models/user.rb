class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 下記の記述は、たくさんpost_imageを持っているという意味である
  has_many :post_images, dependent: :destroy

end
