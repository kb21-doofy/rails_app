class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end
end
