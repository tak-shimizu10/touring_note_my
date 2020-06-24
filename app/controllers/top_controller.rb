class TopController < ApplicationController
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
end
