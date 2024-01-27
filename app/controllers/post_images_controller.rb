class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  # 投稿データを全て取得する記述
  def index
    @post_images = PostImage.all
  end

  # PostImageテーブルの中にあるidが（○○○）のレコードを取得する。
  def show
    @post_image = PostImage.find(params[:id])
  end

  # 投稿データのストロングパラメータの記述
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
