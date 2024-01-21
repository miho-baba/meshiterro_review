class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    
  end

  def index
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private
  
  def post_image_params
    
  end
end
