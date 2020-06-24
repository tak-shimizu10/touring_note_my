class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = user.posts.order("created_at DESC").page(params[:page]).per(5)
    @posts = Post.includes(:user)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :birthday, :prefecture_id, :bike_name, :avatar_image, :bike_name )
  end

end
