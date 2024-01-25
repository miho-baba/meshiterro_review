class PostImage < ApplicationRecord

  has_one_attached :image
  # 下記の記述は、userに属しているという意味
  belongs_to :user

def get_image
end




end
