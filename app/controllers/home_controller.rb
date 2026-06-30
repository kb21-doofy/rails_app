class HomeController < ApplicationController
  skip_forgery_protection
  # GET /home — ユーザー一覧を返す
  def index
    @users = User.all
  end

  # POST /home — ユーザーを登録する
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
